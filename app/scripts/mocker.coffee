class Mocker

  constructor: (@state) ->

  tiggerTickets:() ->
    setTimeout (=>
      @state.lobby.tickets.push {name:'bill'}
      @state.lobby.gameReady = true
      @state.lobby.gameUrl = '#game/1'
    ), 50

  joinGame: () ->
    @state.games.push
      yourTurn:false
    
window.Mocker = Mocker
