library(tidyverse)

animal_tag_vector <- c("dog", "Labrador", "cat",
                       "animal", "pet")

transport_tag_vector <- c("car", "van", "vehicle",
                          "boat", "sailing boat", "bike",
                          "train", "metro")

leisure_tag_vector <- c("sport", "music", "sailing",
                        "walking", "running", "cycling",
                        "biking", "festival", "party")

composition_tag_vector <- c("aerial", "above", "soft focus",
                            "close-up", "below", "portrait",
                            "movement", "stillness", "low",
                            "high", "drone")

color_tag_vector <- c("black", "blue", "green",
                      "bright", "dark", "red",
                      "yellow", "orange", "purple",
                      "turquoise", "brown", "white",
                      "pink")

emotions_tag_vector <- c("cute", "sweet", "beautiful",
                         "happy", "sad", "angry",
                         "friendly", "love")

main_theme_vector <- c("coast", "urban", "rural")

sub_theme_vector_coast <- c("sea", "beach", "coast",
                            "sand", "water", "waves", 
                            "ocean", "nature", "natural",
                            "environment", "outdoors", "no people",
                            "beauty in nature", "cliffs", "coastline")

sub_theme_vector_urban <- c("city", "town", "urban",
                            "road", "built-up", "buildings",
                            "people", "busy")

sub_theme_vector_rural <- c("countryside", "nature", "rural",
                            "trees", "grass", "fields",
                            "nature", "natural", "outdoors",
                            "environment", "no people", "beauty in nature")

tag_list <- list("contents" = list("animals" = animal_tag_vector,
                                   "transport" = transport_tag_vector,
                                   "leisure" = leisure_tag_vector),
                 "composition" = composition_tag_vector,
                 "colors" = color_tag_vector,
                 "main_themes" = main_theme_vector,
                 "sub_themes" = list("coast" = sub_theme_vector_coast,
                                     "urban" = sub_theme_vector_urban,
                                     "rural" = sub_theme_vector_rural))

media_types <- c("Photo", "Video", "Illustration")

file_extensions_photo <- c(".jpg", ".jpeg", ".tif",
                           ".tiff", ".png")

file_extensions_photo_raw <- c(".raw", ".cr2", ".cr3",
                               ".dng")

file_extensions_video <- c(".mp4", ".avi", ".mov")

file_extensions_video_raw <- c(".mxf")

file_extensions_illustration <- c(".svg")

file_types_list <- list("media_types" = media_types,
                        "file_extensions" = list("photo" = file_extensions_photo,
                                                 "photo_raw" = file_extensions_photo_raw,
                                                 "video" = file_extensions_video,
                                                 "video_raw" = file_extensions_video_raw,
                                                 "illustrations" = file_extensions_illustration))

metadata <- list("tags" = tag_list,
                 "file_types" = file_types_list)

saveRDS(metadata, file = "~/Documents/metadata-shiny/data/output/metadata.RDS")





















