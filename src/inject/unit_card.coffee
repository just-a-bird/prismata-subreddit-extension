PS.FlyoutService

###*
Generates a mousehover link with the name of the unit
@class
@requires FlyoutService
@param {Unit} unit
###
class PS.UnitCard
  @className: 'prismata-subreddit-extension-link'

  constructor: (unit)->
    @unit = unit
    @el = null # {HTMLElement}
    @cardImageUrl = null # {String}
    @match = null

  ###*
  This method is called from Units. It returns a replacement string, and then
  it expects to receive the element generated from such string on #setElement
  @method
  @returns {String} Element to be generated in a string form
  ###
  replacementString: (match)->
    @match = match
    "<a class=\"#{PS.UnitCard.className}\" href=\"#{@unit.url}\"><span class=\"flair flair-#{@unit.flairName}\"></span>#{match}</a>"

  ###*
  Should be called to set the element generated from the #replacementString
  @method
  @param {HTMLElement} element
  ###
  setElement: (el)->
    @el = el
    @el.style.whiteSpace = 'nowrap'
    @_addEvents()
    return

  _addEvents: ->
    @el.addEventListener 'mouseover', => @_showFlyout()
    @el.addEventListener 'mouseout', => @_hideFlyout()

  _showFlyout: ->
    PS.FlyoutService.show @unit.panelUrl

  _hideFlyout: ->
    PS.FlyoutService.hide @unit.panelUrl

  _setHref: ->
    @el.href = @cardImageUrl


