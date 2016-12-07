paths <- c("data", "results", "output")

for(path in paths){
  unlink(path, recursive = TRUE)
  dir.create(path)
}

source("tidy_graph.R")
rmarkdown::render("index.Rmd", output_dir = "output")
rmarkdown::render("data.Rmd", output_dir = "output")
rmarkdown::render("results.Rmd", output_dir = "output")
rmarkdown::render("workingnote.Rmd", output_dir = "output")

