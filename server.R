source("global.R", local = TRUE)

server <- function(input, output, session){
  
  ### Functions ###
  
  
  
  ### Variables ###
  
  
  
  ### Reactives ###
  
  # eventReactive(input$submit_metadata, {
  #   a <- input$media_type
  #   
  #   #add user prefixes to all of these variables
  #   #make it so that TRUE becomes before FALSE
  #   
  #   if (length(input$raw_exists) == 0) {
  #     raw_exists <- FALSE
  #     raw_name <- "NULL"
  #     raw_extension <- "NULL"
  #   } else if (length(input$raw_exists) == 1) {
  #     raw_exists <- TRUE
  #     raw_name <- input$file_name
  #     raw_extension <- input$raw_extension
  #   } else if (length(input$raw_exists) == 2) {
  #     raw_exists <- TRUE
  #     raw_name <- input$raw_name
  #     raw_extension <- input$raw_extension
  #   }
  #   
  #   if (exists(input$main_themes) == FALSE) {
  #     main_themes <- "NULL"
  #     sub_themes <- "NULL"
  #   } else if (exists(input$main_themes) == TRUE & exists(input$sub_themes) == FALSE) {
  #     main_themes <- input$main_themes
  #     sub_themes <- "NULL"
  #   } else if (exists(input$sub_themes) == TRUE) {
  #     main_themes <- input$main_themes
  #     sub_themes <- input$sub_themes
  #   }
  #   
  #   if (exists(input$composition_tags) == TRUE) {
  #     composition_tags <- input$composition_tags
  #   } else if (exists(input$composition_tags) == FALSE) {
  #     composition_tags <- "NULL"
  #   }
  #   
  #   if (exists(input$color_tags) == TRUE) {
  #     color_tags <- input$color_tags
  #   } else if (exists(input$color_tags) == FALSE) {
  #     color_tags <- "NULL"
  #   }
  #   
  #   
  # })
  
  observeEvent(input$submit_metadata, {
    stored_metadata <- read_tsv("~/Documents/metadata-shiny2/data/output/stored_metadata.tsv")
    metadata_df <- map_dfc(.x = completed_metadata,
                           .f = function(x) {
                             x <- paste0("input$", x)
                             if (!is.null(eval(parse(text=x)))) {
                               toString(eval(parse(text=x)))
                             } else if (is.null(eval(parse(text=x)))) {
                               "NULL"
                             }
                           })
    colnames(metadata_df) <- metadata_types
    metadata_df <- bind_rows(stored_metadata, metadata_df)
    write_tsv(metadata_df, "~/Documents/metadata-shiny2/data/output/stored_metadata.tsv")
    remove(stored_metadata, metadata_df)
    
    # use sweet alerts if some fields aren't filled
  })
  
  ### Outputs ###
  
  output$tp1 <- renderText({"Tab panel 1"})
  output$tp2 <- renderText({"Tab panel 2"})
  output$tp3 <- renderText({"Tab panel 3"})
  output$tp4 <- renderText({"Tab panel 4"})
  
}