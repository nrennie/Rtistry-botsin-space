# Load packages -----------------------------------------------------------

library(aRt)
library(usefunc)
library(rtoot)
library(ggplot2)

# Create aRt --------------------------------------------------------------

col1 <- usefunc::random_hex(n = 1)
col2 <- usefunc::complementary_colour(col1)
ss <- as.numeric(Sys.time())
x <- sample(10:30, size = 1)
d <- stats::runif(1, 0, 1)
g <- aRt::shatter(n_x = x, n_y = x, decay = d, colour = col1, bg_col = col2, s = ss)
ggsave(filename = "images/img.png",
       plot = g,
       width = 600,
       height = 600,
       units = "px")

# Text for post -----------------------------------------------------------

status <- "Today's Rtistry created with #RStats! #GenArtClub"
alt_text <- "A square generative art piece consisting of a grid of polygons."

# Mastodon auth -----------------------------------------------------------

mastodon_token <- structure(
  list( 
    bearer   = Sys.getenv("MASTODON_TOKEN"),
    type     = "user",
    instance = "botsin.space" 
  ),
  class = "rtoot_bearer"
)

# Post to Mastodon --------------------------------------------------------

rtoot::post_toot(
  status   = status,
  media    = "images/img.png",
  alt_text = alt_text,
  token    = mastodon_token
)

# Clean up file -----------------------------------------------------------

file.remove("images/img.png")
