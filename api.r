library(plumber)
library(metafor)
library(ggplot2)

#* @post /random_meta
#* @param y: List of effect sizes
#* @param v: List of variances
random_effects_meta <- function(y, v) {
  res <- rma(yi = unlist(y), vi = unlist(v), method = "REML")
  return(summary(res))
}

#* @get /forest_plot
#* @param y: List of effect sizes
#* @param v: List of variances
#* @png
function(y, v) {
  res <- rma(yi = unlist(y), vi = unlist(v), method = "REML")
  forest(res)
}

#* @get /funnel_plot
#* @param y: List of effect sizes
#* @param v: List of variances
#* @png
function(y, v) {
  res <- rma(yi = unlist(y), vi = unlist(v), method = "REML")
  funnel(res)
}

#* @post /upload_data
#* @param file: The CSV file to upload
#* @post
function(file) {
  data <- read.csv(file$datapath)
  return(summary(data))
}
