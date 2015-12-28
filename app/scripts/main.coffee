class AppState
  inLobby: true
  hasGames:false
  lobby:
    name: 'chris'
    joined: false
    tickets: []
    gameReady: false
    gameUrl: ''
  games: []
  constructor: () ->
    @mocker = new Mocker(@)
    Array.observe @games, (changes) =>
      for c in changes
        @hasGames = @games.length != 0
    Object.observe @, (changes) =>
      for c in changes
        if c.name == 'currentGame'
          console.log "CURRENT GAME CHANGED"
    @mocker.init()
  register: () =>
    @lobby.joined = true
    # if ENV == 'dev'
    @mocker.triggerTickets()
  joinGame: () =>
    @mocker.joinGame()
    @inLobby = false
  showLobby: () =>
    @inLobby = true
    @currentGame = null
    @mocker.rejoinLobby()
  showState: () =>
    console.log @
  displayGame: (e, context) =>
    game = context.game
    @currentGame = game
    cards = @currentGame.redCards
    # hack to get the cardslist to rerender
    @currentGame.redCards = cards.splice(0, cards.length)
    @inLobby = false
  playCard: (e, context) =>
    @currentGame.played = true

  togglePlayed: (e, ctx) =>
    @currentGame.played = !@currentGame.played


rivets.bind $('#app'), new AppState
