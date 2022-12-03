source("global.R", local = TRUE)

### Selectoze choice vectors ###



### JS ###

jscode <- "
shinyjs.collapse = function(boxid) {
$('#' + boxid).closest('.box').find('[data-widget=collapse]').click();
}
"


### CSS ###



ui <- dashboardPage(skin = "black",
                    
                    header <- dashboardHeader(title = "Metadata"
                                              # tags$li(a(href = "https://www.immunocore.com",
                                              #           img(src = "logo2.png",
                                              #               title = "Immunocore",
                                              #               height = "25px"),
                                              #           style = "padding-top:12px;
                                              #           padding-bottom:5px;
                                              #           padding-left:0px !important;
                                              #           margin-left:0px !important;"),
                                              #         class = "dropdown")
                    ),
                    
                    sidebar <- dashboardSidebar(width = 240,
                                                shinyjs::useShinyjs(),
                                                #shinyjs::inlineCSS(css),
                                                shinyjs::extendShinyjs(text = jscode, functions = c('disableTab','enableTab','collapse')),
                                                sidebarMenu(id = "main_menu", 
                                                            style = "font-size:16px",
                                                            add_busy_bar(color = "#0096FF", timeout = 400, height = "4px"),
                                                            menuItem("Overview",
                                                                     tabName = "overview",
                                                                     icon = icon("console",
                                                                                 lib = "glyphicon"
                                                                     )
                                                            ),
                                                            conditionalPanel(condition = "input.main_menu == 'overview'"
                                                            ),
                                                            menuItem("Metadata input",
                                                                     tabName = "metadata_input",
                                                                     icon = icon("console",
                                                                                 lib = "glyphicon"
                                                                     )
                                                            ),
                                                            conditionalPanel(condition = "input.main_menu == 'metadata_input'"            
                                                            ),
                                                            menuItem("About",
                                                                     tabName = "about",
                                                                     icon = icon("info-sign",
                                                                                 lib = "glyphicon"
                                                                     )
                                                            ),
                                                            conditionalPanel(condition = "input.main_menu == 'about'"           
                                                            )
                                                )
                    ),
                    
                    body <- dashboardBody(
                      #tags$style(css),
                      tabItems(
                        tabItem(tabName = "overview", 
                                fluidRow(
                                  box(width = 4,
                                      title = "Box 1",
                                      style = "font-size:14px; border-left: outset #3EB489;",
                                      collapsible = TRUE,
                                      collapsed = TRUE,
                                  )
                                ),
                                fluidRow(
                                  downloadBttn("download_p1",
                                               color = "primary",
                                               size = "sm"
                                  ),
                                  style="padding-left:15px; padding-top:5px;"
                                ),
                                fluidRow(style = "margin-top: 21px", 
                                         column(width = 12, style="padding:0px",
                                                tabBox(width = 12, 
                                                       tabPanel("Tab panel 1",
                                                                textOutput("tp1")
                                                       ),
                                                       tabPanel("Tab panel 2",
                                                                textOutput("tp2")
                                                       )
                                                )
                                         )
                                )
                        ),
                        tabItem(tabName = "metadata_input", #submit button, file identifier
                                fluidRow(
                                  box(id = "identifiers",
                                      title = "Identifiers",
                                      collapsible = TRUE,
                                      textInput(inputId = "file_name",
                                                "Enter the identifier/file name"
                                      ),
                                      selectizeInput(inputId = "media_type",
                                                     "Enter media type",
                                                     choices = media_types,
                                                     multiple = FALSE
                                      ),
                                      selectizeInput(inputId = "file_extension",
                                                     "Enter file extension",
                                                     choices = file_extensions_photo,
                                                     multiple = FALSE
                                      ),
                                      checkboxInput(inputId = "raw_exists",
                                                    label = "Raw exists",
                                      ),
                                      tags$div(id = "raw_different_dynamics"),
                                      tags$div(id = "raw_name_dynamic"),
                                      tags$div(id = "raw_extension_dynamic"),
                                      actionBttn(inputId = "next_identifiers",
                                                 label = "Next section",
                                                 size = "sm"
                                      )
                                  )
                                ),  
                                fluidRow(
                                  box(id = "details",
                                      title = "Details",
                                      collapsible = TRUE,
                                      collapsed = TRUE,
                                      textInput(inputId = "title_input",
                                                "Create a title (80 chars max)"
                                      ),
                                      textInput(inputId = "description_input",
                                                "Create a description (200 chars max)"
                                      ),
                                      actionBttn(inputId = "next_details",
                                                 label = "Next section",
                                                 size = "sm")
                                  )
                                ),
                                fluidRow(
                                  box(id = "themes",
                                      title = "Themes (optional, for categorisation and tag autofill, add tooltip",
                                      collapsible = TRUE,
                                      collapsed = TRUE,
                                      selectizeInput(inputId = "main_themes",
                                                     "Main themes",
                                                     choices = main_theme,
                                                     multiple = TRUE
                                      ),
                                      selectizeInput(inputId = "sub_themes",
                                                     "Sub themes",
                                                     choices = sub_theme_coast, #does not change tag choices, only tags pre-selected
                                                     multiple = TRUE
                                      ),
                                      actionBttn(inputId = "next_themes",
                                                 label = "Next section",
                                                 size = "sm")
                                  )
                                ),
                                fluidRow(
                                  box(id = "tags",
                                      title = "Tags",
                                      collapsible = TRUE,
                                      collapsed = TRUE,
                                      selectizeInput(inputId = "contents_tags",
                                                     "Contents tags",
                                                     choices = contents_tag,
                                                     multiple = TRUE
                                      ),
                                      selectizeInput(inputId = "composition_tags",
                                                     "Composition tags",
                                                     choices = composition_tag,
                                                     multiple = TRUE
                                      ),
                                      selectizeInput(inputId = "color_tags",
                                                     "Color tags",
                                                     choices = color_tag,
                                                     multiple = TRUE
                                      ),
                                      actionBttn(inputId = "submit_metadata",
                                                 label = "Submit metadata",
                                                 size = "sm")
                                  )
                                )
                        ),
                        tabItem(tabName = "about",
                                fluidRow(style = "margin-top: 21px", 
                                         column(width = 12,
                                                style="padding:0px",
                                                tabBox(width = 12,
                                                       tabPanel("Dev info",
                                                                includeMarkdown("README.md") # recommended to set absolute path
                                                       )
                                                )
                                         )
                                         
                                )
                        )
                      )
                    ),
                    
                    dashboardPage(
                      header,
                      sidebar,
                      body
                    )
)

