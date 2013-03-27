$ ->
  $('form').submit ->
    ajaxSubmit()
    return false
  $("#type").click ->
    typeSelected()

@typeSelected = ->
  type_val = $("#type").val()

  if type_val is "Distance"
    $("#from_unit select").remove()
    $("#from_unit").append "<select name='from_unit'>" +
                           "<option>Feet</option>" +
                           "<option>Meters</option>" +
                           "</select>"
    $("#to_unit select").remove()
    $("#to_unit").append "<select name='to_unit'>" +
                         "<option>Feet</option>" +
                         "<option>Meters</option>" +
                         "</select>"

  else if type_val is "Weight"
    $("#from_unit select").remove()
    $("#from_unit").append "<select name='from_unit'>" +
                           "<option>Kilograms</option>" +
                           "<option>Grams</option>" +
                           "<option>Ounces</option>" +
                           "<option>Pounds</option>" +
                           "</select>"
    $("#to_unit select").remove()
    $("#to_unit").append "<select name='to_unit'>" +
                         "<option>Kilograms</option>" +
                         "<option>Grams</option>" +
                         "<option>Ounces</option>" +
                         "<option>Pounds</option>" +
                         "</select>"

  else if type_val is "Temperature"
    $("#from_unit select").remove()
    $("#from_unit").append "<select name='from_unit'>" +
                           "<option>Celsius</option>" +
                           "<option>Fahrenheit</option>" +
                           "<option>Kelvin</option>" +
                           "</select>"
    $("#to_unit select").remove()
    $("#to_unit").append "<select name='to_unit'>" +
                         "<option>Celsius</option>" +
                         "<option>Fahrenheit</option>" +
                         "<option>Kelvin</option>" +
                         "</select>"

  else if type_val is "Volume"
    $("#from_unit select").remove()
    $("#from_unit").append "<select name='from_unit'>" +
                           "<option>Liters</option>" +
                           "<option>Gallons</option>" +
                           "</select>"
    $("#to_unit select").remove()
    $("#to_unit").append "<select name='to_unit'>" +
                         "<option>Liters</option>" +
                         "<option>Gallons</option>" +
                         "</select>"

@ajaxSubmit = ->
  form = $('form')
  beforeSubmit()
  $.ajax '/convert',
    data: form.serialize()
    success: (response) -> formSuccess(response)
    error: -> errorHandling()

@beforeSubmit = ->
  $("button").hide()
  $("#result").html("")
  spinner = new Spinner(spinOpts).spin()
  $("#result").append(spinner.el)

@formSuccess = (response) ->
  $("button").show()
  $("#result").html(response)

@errorHandling = ->
  $("button").show()
  $("#result").html("Sorry, I had a problem talking to the server.")
  console.log "Something went wrong."

@spinOpts = {
  lines: 13, # The number of lines to draw
  length: 7, # The length of each line
  width: 4, # The line thickness
  radius: 10, # The radius of the inner circle
  corners: 1, # Corner roundness (0..1)
  rotate: 0, # The rotation offset
  color: '#000', # #rgb or #rrggbb
  speed: 1, # Rounds per second
  trail: 60, # Afterglow percentage
  shadow: false, # Whether to render a shadow
  hwaccel: false, # Whether to use hardware acceleration
  className: 'spinner', # The CSS class to assign to the spinner
  zIndex: 2e9, # The z-index (defaults to 2000000000)
  top: 'auto', # Top position relative to parent in px
  left: 'auto' # Left position relative to parent in px
}
