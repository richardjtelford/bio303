library(checker)
pak <- read.csv(
  text = "package, recommended, minimum, message
        tidyverse, 1.3, NA, NA
        vegan, 2.6.0, NA, NA
        ggvegan, 0.1.0, NA, install with remotes::install_github('gavinsimpson/ggvegan')",
  strip.white = TRUE
)

prog <- read.csv(text = 'program, recommended, minimum, message
             rstudio, 2022.7.1.554, NA, NA
             R, "4.2.1", "4.1.1", NA
             quarto, 1.2.0, NA, NA',
             strip.white = TRUE)
opt <- read.csv(text = 'option, value, message
             "save_workspace", "never", NA
             "load_workspace", "FALSE", "For reproducibility"',
             strip.white = TRUE)

fs::dir_create("checker")
fs::file_create( "checker/chk_bio303.yaml")
(chk_make(path = "checker/chk_bio303.yaml", programs = prog, packages = pak, options = opt))

chk_requirements("checker/chk_bio303.yaml")
