random_shatter <- function() {
  ss <- as.numeric(Sys.time())
  col1 <- usefunc::random_hex(n = 1)
  col2 <- usefunc::complementary_colour(col1)
  x <- sample(10:30, size = 1)
  d <- stats::runif(1, 0, 1)
  g <- aRt::shatter(
    n_x = x, n_y = x, decay = d,
    colour = col1, bg_col = col2, s = ss
  )
  return(g)
}

random_mirrored <- function() {
  ss <- as.numeric(Sys.time())
  n <- sample(5:20, size = 1)
  w <- sample(2:6, size = 1)
  col_palette <- PrettyCols::prettycols(sample(names(PrettyCols::PrettyColsPalettes), size = 1))
  g <- aRt::mirrored(n = n, w = w, col_palette = col_palette, s = ss)
  return(g)
}

random_random_tessellation <- function() {
  ss <- as.numeric(Sys.time())
  n <- sample(8:20, size = 1)
  dj <- runif(1, 0.1, 0.5)
  col_palette <- PrettyCols::prettycols(sample(names(PrettyCols::PrettyColsPalettes), size = 1))
  bg_col <- usefunc::complementary_colour(col_palette[1])
  g <- aRt::random_tessellation(
    n_x = n, n_y = n,
    deg_jitter = dj,
    line_col = bg_col,
    bg_col = bg_col,
    col_palette = col_palette,
    s = ss
  )
  return(g)
}

random_window_boxes <- function() {
  n <- sample(5:15, size = 1)
  lwd <- runif(1, 1, 4)
  col_palette <- PrettyCols::prettycols(sample(names(PrettyCols::PrettyColsPalettes), size = 1))
  g <- aRt::window_boxes(
    n_x = n, n_y = n,
    linewidth = lwd, col_palette = col_palette
  )
  return(g)
}

random_crosshatch <- function() {
  ss <- as.numeric(Sys.time())
  n <- sample(5:20, size = 1)
  n_lines <- sample(5:12, size = 1)
  lwd <- runif(1, 1, 4)
  overlap <- runif(1, 0.5, 0.5)
  slope <- runif(1, 0.5, 0.5)
  col_palette <- PrettyCols::prettycols(sample(names(PrettyCols::PrettyColsPalettes), size = 1))
  bg_col <- usefunc::complementary_colour(col_palette[1])
  g <- aRt::crosshatch(
    n_x = n, n_y = n, n_lines = n_lines,
    line_overlap = overlap,
    line_slope = slope,
    linewidth = lwd,
    col_palette = col_palette,
    bg_col = bg_col,
    s = ss
  )
  return(g)
}

random_stackture <- function() {
  ss <- as.numeric(Sys.time())
  col_palette <- PrettyCols::prettycols(sample(names(PrettyCols::PrettyColsPalettes), size = 1))
  bg_col <- usefunc::complementary_colour(col_palette[1])
  n <- sample(5:15, size = 1)
  h <- stats::runif(1, 1.1, 1.6)
  g <- aRt::stackture(
    n_x = n, n_y = n,
    min_height = 1, max_height = h,
    min_width = 1, max_width = h,
    interpolate = TRUE,
    col_palette = col_palette,
    bg_col = bg_col,
    s = ss
  )
  return(g)
}
