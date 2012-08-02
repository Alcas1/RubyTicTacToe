require_relative '../lib/check_for_win'
require_relative '../lib/output'
require_relative '../lib/game_logic'
require_relative '../lib/command_line_game'

newGame=CommandLineGame.new
newGame.gameSetup
newGame.computerFirstLoop

class Interface

end