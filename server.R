shinyServer(
	function(input, output, session)
	{
	 
	  output$county <- renderUI({
	    selectInput(
	      inputId = "county", 
	      label = "county",
	      choices = as.character(unique(njmls_df$county)),
	      selected = "Hudson")
	    
	  })
	  
	  output$town <- renderUI({
	    available <- njmls_df[njmls_df$county == input$county, "town"]
	    selectInput(
	      inputId = "town", 
	      label = "town:",
	      choices = unique(available),
	      selected = unique(available)[1])
	    
	  })
	  
	  # Initial Map
	  output$map <- renderLeaflet({
	    leaflet(data = njmls_df) %>%
	      addProviderTiles("OpenStreetMap.Mapnik") %>%
	      setView(lng=-73.935242, lat=40.730610 , zoom=11)
	  })
	  
	  
	  
	  # show data using DataTable
	  output$table <- DT::renderDataTable({
	  	datatable(njmls_df, rownames=FALSE) %>%
	  	formatStyle(input$selected, background="skyblue", fontWeight='bold')
	  	})
	}
)