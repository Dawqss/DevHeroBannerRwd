APP = undefined
lastScrollTop = undefined
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
  backgroundsRaw = $('.js-rwd-bg').attr('sizes')
  backgrounds = $.parseJSON(backgroundsRaw)
  windowWidth = $(window).width()

  changeRwd = (windowWidth) ->
    $.each sizesPoints, (key, value) ->
      if backgrounds[sizes[key]] != ''
        if value.max == null
          if windowWidth > value.min
            el.css("background", "url(" + backgrounds[sizes[key]] + ")");
          else

        else
          if windowWidth >= value.min && windowWidth < value.max
            el.css("background", "url(" + backgrounds[sizes[key]] + ")");

  changeRwd(windowWidth)

  $(window).resize ->
    windowWidth = $(window).width()
    changeRwd(windowWidth)



APP.init ->
  App.rwdBackground()

$(document).ready ->
  APP.init()
  return