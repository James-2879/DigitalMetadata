### Libraries ###

library(tidyverse)
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(shinyBS)
library(bsplus)
library(shinybusy)
#library(ggpubr)
#library(Cairo)
#library(kableExtra)
library(DT)
library(markdown)
library(shinyjs)
library(V8)

#options(shiny.usecairo = T) #better graphics

### Metadata ###

metadata <- readRDS(file = "~/Documents/metadata-shiny/data/output/metadata.RDS")

contents_tag <- c(metadata[["tags"]][["contents"]][["animals"]],
                  metadata[["tags"]][["contents"]][["leisure"]],
                  metadata[["tags"]][["contents"]][["transport"]])
                  
composition_tag <- metadata[["tags"]][["composition"]]
color_tag <- metadata[["tags"]][["colors"]]
main_theme <- metadata[["tags"]][["main_themes"]]
coast_theme_tags <- metadata[["tags"]][["sub_themes"]][["coast"]]
urban_theme_tags <- metadata[["tags"]][["sub_themes"]][["urban"]]
rural_theme_tags <- metadata[["tags"]][["sub_themes"]][["rural"]]

media_types <- metadata[["file_types"]][["media_types"]]

file_extensions_photo <- metadata[["file_types"]][["file_extensions"]][["photo"]]
file_extensions_photo_raw <- metadata[["file_types"]][["file_extensions"]][["photo_raw"]]
file_extensions_video <- metadata[["file_types"]][["file_extensions"]][["video"]]
file_extensions_video_raw <- metadata[["file_types"]][["file_extensions"]][["video_raw"]]
file_extensions_illustration <- metadata[["file_types"]][["file_extensions"]][["video"]]

metadata_types <- completed_metadata <- c("file_name",
                                          "media_type",
                                          "file_extension",
                                          "raw_exists",
                                          "raw_name",
                                          "raw_extension",
                                          "title_input",
                                          "description_input",
                                          "main_themes",
                                          "sub_themes",
                                          "contents_tags",
                                          "composition_tags",
                                          "color_tags")
### Data ###




### Global vars ###