library(readr)
library(dplyr)
library(ggplot2)
library(ggrepel)
Top <- read_csv("./Top_10000_Popular_Movies.csv")

Top$release_date <- as.Date(Top$release_date)


Top <- with(Top, Top[(release_date >= "2020-01-01" & release_date < "2022-01-01"), ])

# View(Top)

p <- ggplot(Top, aes(x=release_date, y=popularity)) + geom_point()
p <- p + geom_text_repel(data=subset(Top, popularity>1700), 
                         aes(x=release_date, y=popularity,
                             label=original_title)
                         , 
                         box.padding = 0.5)
p <- p + labs(title="Top 10,000 Most Popular Movies", x="Release Date", y="Popularity Score") 
p <- p + scale_y_continuous(labels = function(x) format(x, scientific = TRUE))
ggsave("./top_movies.png")