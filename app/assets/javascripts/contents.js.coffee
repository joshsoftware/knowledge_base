# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  load_tags()

@load_tags = ->
  $("#contentTags").tokenInput("/contents/tags.json", {
    preventDuplicates: true,
    allowFreeTagging: true,
    prePopulate: $("#contentTags").data("pre"),
    theme: "facebook",    
  })