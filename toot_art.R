# Load packages -----------------------------------------------------------

library(aRt)
library(usefunc)
library(rtoot)

# Create aRt --------------------------------------------------------------

set.seed(123)
col1 <- usefunc::random_hex()
col2 <- usefunc::complementary_colour(col1)
ss <- as.numeric(Sys.time())
x <- sample(10:30, size = 1)
d <- stats::runif(1, 0, 1)
temp_file <- tempfile(fileext = ".png")
png(filename = temp_file, with = 600, height = 600, units = "px")
aRt::shatter(n_x = x, n_y = x, decay = d, colour = col1, bg_col = col2, s = ss)
dev.off()


# Text for post -----------------------------------------------------------

status <- "Today's aRt created with #RStats! #GenArtClub"
alt_text <- "A square generative art piece consisting of a grid of polygons."


# Mastodon auth -----------------------------------------------------------

mastodon_token <- structure(
  list( 
    bearer   = Sys.getenv("RTOOT_DEFAULT_TOKEN"),
    type     = "user",
    instance = "botsin.space" 
  ),
  class = "rtoot_bearer"
)


# Post to Mastodon --------------------------------------------------------

rtoot::post_toot(
  status   = status,
  media    = temp_file,
  alt_text = alt_text,
  token    = mastodon_token
)
