# players take turns placing either an X or an O onto nil spaces on a 3x3 grid until one gets three in a row/across or the board is filled
require 'pry-byebug'

class Board
  def initialize(rows = 3, columns = 3)
    $game_board = Array.new(rows) { Array.new(columns) }
    p $game_board
  end
end

class Player
  attr_accessor :name, :symbol, :row, :column

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def select_row
    p "#{@name} it's your turn! Please input your desired row (0-2) and press enter"
    @row = gets.chomp.to_i
    if @row < 3 && @row >= 0
      @row = row
    else
      select_row
    end
  end

  def select_column
    p "great choice #{@name}! Next, please enter your desired column (0-2) and press enter"
    @column = gets.chomp.to_i
    if @column < 3 && @column >= 0
      @column = column
    else
      select_column
    end
  end

  def place_symbol(row, column)
    if $game_board[row][column].nil?
      $game_board[row][column] = @symbol
      p $game_board
    else
      play_round
    end
  end

  def winner?
    if $game_board[0][0] == @symbol && $game_board[0][1] == @symbol && $game_board[0][2] == @symbol ||
       $game_board[0][0] == @symbol && $game_board[1][0] == @symbol && $game_board[2][0] == @symbol ||
       $game_board[1][0] == @symbol && $game_board[1][1] == @symbol && $game_board[1][2] == @symbol ||
       $game_board[2][0] == @symbol && $game_board[2][1] == @symbol && $game_board[2][2] == @symbol ||
       $game_board[0][1] == @symbol && $game_board[1][1] == @symbol && $game_board[2][1] == @symbol ||
       $game_board[0][2] == @symbol && $game_board[1][2] == @symbol && $game_board[2][2] == @symbol ||
       $game_board[0][0] == @symbol && $game_board[1][1] == @symbol && $game_board[2][2] == @symbol ||
       $game_board[2][0] == @symbol && $game_board[1][1] == @symbol && $game_board[0][2] == @symbol

      p "Congratulations #{@name}! You are the winner! Start a new game if you would like to play again."
    end
  end

  def play_round
    select_row
    select_column
    place_symbol(row, column)
    winner?
  end
end

Board.new
p johnny = Player.new('Johnny', 'X')
p bob = Player.new('Bob', 'O')

i = 0
while i < 9
  johnny.play_round
  break if johnny.winner?

  i += 1
  break if i == 9

  bob.play_round
  break if bob.winner?

  i += 1
end
