if typeof jQuery == 'undefined'
  headElement = document.getElementsByTagName("head")[0]
  linkElement = document.createElement("script")
  linkElement.src = "//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
  headElement.appendChild(linkElement)

screamout = ->
  window.scrollTo(0, 0)
 
  jQ('<link>',  {
    href: "http://localhost:8080/assets/screamout.css",
    rel: "stylesheet",
    type: "text/css"
  }).appendTo('body')


  jQ('<iframe>', {
    style: "background-color: red"
    id:  'screamout',
    name: "newpage",
    frameborder: 0,
    scrolling: "no",
    src: "http://localhost:8080/contents/new",
    allowTransparency: true
  }).appendTo('body')
  
  jQ('*','body').not("#screamout").css("opacity","0.8")
  jQ('*','body').not("#screamout").css("pointer-events","none")

  $("body").not('#screamout').click ->
    jQ('#screamout').remove()  
    jQ('*','body').not("#screamout").css("opacity","1")
    jQ('*','body').not("#screamout").css("pointer-events","none")
test = ->
  if @jQuery
    @jQ = jQuery    
    screamout()
    clearInterval(@testInterval)

receiveMessage = (event) ->
  if event.data is "removetheiframe"
    jQ('#screamout').remove()  
    jQ('*','body').not("#screamout").css("opacity","1")
    jQ('*','body').not("#screamout").css("pointer-events","none")
  return
window.addEventListener "message", receiveMessage, false   

@testInterval = setInterval(->
  (test())
, 1000)