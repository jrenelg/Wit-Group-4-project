﻿$ ->
  stage = new Kinetic.Stage({
                container: "container",
                width: 1200,
                height: 2000
            });
  x=77
  y=80
  jsonData = {}
  diagrams = []

  diagram_selected = (data) ->
    console.log data
  
  unselect_all_diagrams = ->
    cd.UnSelect() for cd in diagrams
  

  $('#btnGetData').click ->
    $.get '/home/GetTestData/', (all_classes) ->
      diagrams = []
      for class_data in all_classes	    
        classDiagram = new ClassDiagram(x, y, class_data, unselect_all_diagrams, diagram_selected)
        diagrams.push classDiagram 
        stage.add(classDiagram.get_Layer());
        x = x + 220
        if x>1000
          y = 250+y 
          x = 77
    