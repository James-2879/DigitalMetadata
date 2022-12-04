source("global.R", local = TRUE)

server <- function(input, output, session){
  
  ### Functions ###
  
  
  
  #ui box accents could go green when filled
  
  ### Variables ###
  
  
  
  ### UI reactives ###
  
  observeEvent(input$next_identifiers, {
    js$collapse("identifiers")
    js$collapse("details")
  })
  
  observeEvent(input$next_details, {
    js$collapse("details")
    js$collapse("tags")
  })
  
  observeEvent(input$raw_exists, {
    #probably use reactive values to show whether this is open or close
    if (input$raw_exists == TRUE) {
      insertUI(
        selector = '#raw_name_dynamic',
        ui = tags$div(
          checkboxInput(inputId = "raw_different",
                        label = "Raw file under different name"
          ),
          id = "raw_different_dynamic_inserted"
        )
      )
      insertUI(
        selector = '#raw_name_dynamic',
        ui = tags$div(
          selectizeInput(inputId = "raw_extension",
                         "Enter raw file extension",
                         choices = file_extensions_photo_raw,
                         multiple = FALSE,
                         selected = ".cr3"
          ),
          id = "raw_extension_dynamic_inserted"
        )
      )
    }
    else if (input$raw_exists == FALSE) {
      removeUI(
        selector = '#raw_different_dynamic_inserted'
      )
      removeUI(
        selector = '#raw_extension_dynamic_inserted'
      )
      removeUI(
        selector = '#raw_name_dynamic_inserted'
      )
    }
  })
  
  observeEvent(input$raw_different, {
    if (input$raw_different == TRUE) {
      insertUI(
        selector = '#raw_name_dynamic',
        ui = tags$div(
          textInput(inputId = "raw_name",
                    "Enter the raw identifier/file name - should be dynamically rendered"
          ),
          id = "raw_name_dynamic_inserted"
        )
      )
    }
    else if (input$raw_different == FALSE) {
      removeUI(
        selector = '#raw_name_dynamic_inserted'
      )
    }
  })
  

  ### Search reactives ###
  
  observeEvent(input$theme, {
    if (input$theme == "coast") {
      shinyjs::enable("theme_tags")
      updateSelectizeInput(session, 'theme_tags', choices = coast_theme_tags, server = TRUE)
    } else if (input$theme == "rural") {
      shinyjs::enable("theme_tags")
      updateSelectizeInput(session, 'theme_tags', choices = rural_theme_tags, server = TRUE)
    } else if (input$theme == "urban") {
      shinyjs::enable("theme_tags")
      updateSelectizeInput(session, 'theme_tags', choices = urban_theme_tags, server = TRUE)
    } else if (input$theme == "") {
      shinyjs::disable("theme_tags") #find the js code from greying out
    }
  })
  
  ### Data reactives ###
  
  observeEvent(input$submit_metadata, {
    js$collapse("tags")
    stored_metadata <- read_tsv("~/Documents/metadata-shiny/data/output/stored_metadata.tsv")
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
    write_tsv(metadata_df, "~/Documents/metadata-shiny/data/output/stored_metadata.tsv")
    remove(stored_metadata, metadata_df)
    
    # use sweet alerts if some fields aren't filled
  })
  
  ### Outputs ###
  
  output$tp1 <- renderText({"Tab panel 1"})
  output$tp2 <- renderText({"Tab panel 2"})
  output$tp3 <- renderText({"Tab panel 3"})
  output$tp4 <- renderText({"Tab panel 4"})
  
}