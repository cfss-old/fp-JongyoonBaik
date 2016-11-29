paths <- c("data", "results", "output")

for(path in paths){
  unlink(path, recursive = TRUE)
  dir.create(path)
}

source("tidy_graph.R")
rmarkdown::render("index.Rmd", output_dir = "output")