class AppState
  lobby:
    name: 'chris'
    joined: false
    tickets: []
    gameReady: false
    gameUrl: ''
  games: []
  constructor: () ->
    @mocker = new Mocker(@)
  register: () =>
    @lobby.joined = true
    # if ENV == 'dev'
    @mocker.tiggerTickets()
  joinGame: () =>
    @mocker.joinGame()


rivets.bind $('#app'), new AppState
