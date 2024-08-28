# Use the rocker RStudio base image
FROM rocker/rstudio:latest

# Install necessary R packages
RUN R -e "install.packages(c('metafor', 'ggplot2', 'dplyr', 'plumber', 'jsonlite', 'knitr', 'rmarkdown'))"

# Expose the RStudio Server port
EXPOSE 8787

# Set environment variables for RStudio
ENV PASSWORD=yourpassword

# Start RStudio Server
CMD ["sh", "-c", "rstudio-server start && tail -f /dev/null"]
