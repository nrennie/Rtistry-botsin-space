# Load packages -----------------------------------------------------------

library(rtoot)
library(ggplot2)
library(aRt)
library(usefunc)
library(PrettyCols)

# Create aRt --------------------------------------------------------------

ss <- as.numeric(Sys.time())
art_type <- sample(c("shatter", "mirrored"), size = 1)

if (art_type == "shatter") {
  col1 <- usefunc::random_hex(n = 1)
  col2 <- usefunc::complementary_colour(col1)
  x <- sample(10:30, size = 1)
  d <- stats::runif(1, 0, 1)
  g <- aRt::shatter(n_x = x, n_y = x, decay = d, colour = col1, bg_col = col2, s = ss)
  temp_file <- tempfile(fileext = ".png")
  ggsave(filename = temp_file,
         plot = g,
         width = 600,
         height = 600,
         units = "px")
} else {
  if (art_type == "mirrored") {
    n <- sample(5:20, size = 1)
    w <- sample(2:6, size = 1)
    col_palette <- PrettyCols::prettycols(sample(names(PrettyCols::PrettyColsPalettes), size = 1))
    g <- aRt::mirrored(n = n, w = w, col_palette = col_palette, s = ss)
    temp_file <- tempfile(fileext = ".png")
    ggsave(filename = temp_file,
           plot = g,
           width = 600,
           height = 600,
           units = "px")
  }
}

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
  media    = temp_file,
  alt_text = alt_text,
  token    = mastodon_token
)
