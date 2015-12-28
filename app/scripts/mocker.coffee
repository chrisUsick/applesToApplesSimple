class Mocker
  games: [
    {played:false, id:1},
    {played:false, id:2},
    {played:false, id:3},
    {played:false, id:4},
  ]
  greenCards: [
    {word:'foo', description:'blah blah'},
    {word:'slimy', description:'(slippery,...)'}
  ]
  redCards: [
    {word:'picture frame', description:'holds a pic'},
    {word:'Dr. Phil', description:'helps people'}
  ]
  constructor: (@state) ->

  init: () ->
    @state.register()
    @state.joinGame()
  triggerTickets:() ->
    tickets = [
      {name: 'bill'}
      {name:'john'}
    ]
    @addTickets tickets
      .finally =>
        @state.lobby.gameUrl = '#game/1'
        @state.lobby.gameReady = true



  randomIndex: (arr) => Math.floor(Math.random() * arr.length)
  joinGame: () ->
    game = @games.splice(0,1)[0]
    game.greenCard = @greenCards[@randomIndex(@greenCards)]
    game.redCards = @getRedCards 2
    @state.games.push game
    @state.currentGame = game

  getRedCards: (count) ->
    @redCards[@randomIndex(@redCards)] for i in [0..count]


  addTickets: (tickets) ->
    if tickets.length != 0
      p = new P (resolve) ->
        setTimeout (->
          resolve()
        ), 50
      p.then =>
        @state.lobby.tickets.push tickets[0]
        tickets.splice(0,1)
        @addTickets tickets

  rejoinLobby: () ->
    tickets =[
      {name:'kimbo'},
      {name:'chris'}
    ]
    @state.lobby.tickets = []
    @addTickets tickets
      .finally =>
        @state.lobby.gameUrl = '#game/2'
        @state.lobby.gameReady = true




window.Mocker = Mocker
