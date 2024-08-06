# Load packages -----------------------------------------------------------

library(rtoot)
library(ggplot2)
library(aRt)
library(usefunc)
library(PrettyCols)


# Source utils functions --------------------------------------------------

source("random_aRt.R")


# Create aRt --------------------------------------------------------------

art_type <- sample(
  c("shatter", "mirrored", "tessellation", "windows", "crosshatch", "stackture"),
  size = 1)

if (art_type == "shatter") {
  g <- random_shatter()
} else {
  if (art_type == "mirrored") {
    g <- random_mirrored()
  } else {
    if (art_type == "tessellation") {
      g <- random_random_tessellation()
    } else {
      if (art_type == "windows") {
        g <- random_window_boxes()
      } else {
        if (art_type == "crosshatch") {
          g <- random_crosshatch()
        } else {
          if (art_type == "stackture") {
            g <- random_stackture()
          }
        }
      }
    }
  }
}
temp_file <- tempfile(fileext = ".png")
ggsave(filename = temp_file,
       plot = g,
       width = 600,
       height = 600,
       units = "px")

# Text for post -----------------------------------------------------------

status <- "Today's #Rtistry created with #RStats!"
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
