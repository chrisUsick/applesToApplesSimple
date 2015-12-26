class State
  name: 'chris'
  joined = false
  constructor: () ->
  register: () =>
    @joined = true
    


state = new State
rivets.bind $('#lobbyApp'), state
