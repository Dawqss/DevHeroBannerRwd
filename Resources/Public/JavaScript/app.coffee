APP = undefined
APP = {}

APP.rwdBackground = ->
  el = $('.js-rwd-bg')
  sizes = ['xs', 's', 'm', 'l']
  sizesPoints = [
    {min: 0, max: 767},
    {min: 768, max: 1023},
    {min: 1024, max: 1349},
    {min: 1350, max: null}
  ]

  iterateElements = ->
    windowWidth = $(window).width()
    $.each el, (index) ->
      console.log(el[index])
      backgroundsRaw = el[index].attr('sizes')
      backgrounds = $.parseJSON(backgroundsRaw)
      changeRwd(windowWidth, backgrounds, el[index])



  changeRwd = (windowWidth, backgrounds, el) ->
    $.each sizesPoints, (key, value) ->
      if backgrounds[sizes[key]] != ''
        if value.max == null
          if windowWidth > value.min
            el.css("background", "url(" + backgrounds[sizes[key]] + ")");
          else

        else
          if windowWidth >= value.min && windowWidth < value.max
            el.css("background", "url(" + backgrounds[sizes[key]] + ")");


  iterateElements()

  $(window).resize ->
    iterateElements()


APP.init = ->
  APP.rwdBackground()

$(document).ready ->
  APP.init()
  return