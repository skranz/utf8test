library(shiny)

txt = "Es grünt so grün, wenn Spaniens Blüten blühn."
Encoding(txt) # "UTF-8
html = markdown::markdownToHTML(text=txt,fragment.only = TRUE,encoding = "UTF-8")
Encoding(html) # "UTF-8"

ui <- fluidPage(
  # Always shown correctly
  HTML(txt),
  HTML(paste0("Encoding:", Encoding(txt))),
  
  # Shown correctly only in rstudio server (UTF-8 encoding)
  # shown wrong in shiny-server (unknown encoding)
  HTML(html),
  HTML(paste0("Encoding:", Encoding(html)))
)
# Run the application 
shinyApp(ui = ui, server = function(...){})

