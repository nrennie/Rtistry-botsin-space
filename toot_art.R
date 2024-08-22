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
  art <- random_shatter()
  g <- art$g
  code <- art$code
} else {
  if (art_type == "mirrored") {
    art <- random_mirrored()
    g <- art$g
    code <- art$code
  } else {
    if (art_type == "tessellation") {
      art <- random_random_tessellation()
      g <- art$g
      code <- art$code
    } else {
      if (art_type == "windows") {
        art <- random_window_boxes()
        g <- art$g
        code <- art$code
      } else {
        if (art_type == "crosshatch") {
          art <- random_crosshatch()
          g <- art$g
          code <- art$code
        } else {
          if (art_type == "stackture") {
            art <- random_stackture()
            g <- art$g
            code <- art$code
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

status <- glue::glue(
  "Today's #Rtistry created with #RStats!\n\nCode: {code}")
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
