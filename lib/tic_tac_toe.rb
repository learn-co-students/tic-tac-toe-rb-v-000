def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

def over?(board)
    if won?(board) || draw?(board) || full?(board)
      true
    else
      false
    end
end


def current_player(board)

playerX = "X"
playerO = "O"

turns = turn_count(board)
remainder = turns % 2

if remainder == 0
  playerX
else
if remainder == 1
  playerO
end
end

end

def turn_count(board)

count = 0



board.each { |item|

if item == " "

else
  #puts item
  count += 1
end
   }

count


end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top_row_win
  [3, 4, 5], #middle win
  [6, 7, 8], #bottom win
  [0, 3, 6], #left side win
  [1, 4, 7], #down middle win
  [2, 5, 8], #right side win
  [0, 4, 8], #left-to-right cross
  [2, 4, 6] #right-to-left cross
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|i| board[i] == "X"} || combo.all?{|i| board[i] == "O"}
      return combo
    elsif board.all?{|i| i == " " || i = nil}
     return false
    end
  end
 if board.all?{|i| i == "X" || i == "O"}
 return false
 end
end

def full?(board)
  if board.all?{|i| i == "X" || i == "O"}
   return true
 end
end

def draw?(board)
    if won?(board) || !full?(board)
      false
    else
      true
    end
  end

  def over?(board)
      if won?(board) || draw?(board) || full?(board)
        true
      else
        false
      end
  end

  def winner(board)
    if won?(board) != nil
      winCombo = won?(board)
      if board[winCombo[0]] == "X"
      "X"
      elsif board[winCombo[0]] == "O"
      "O"
      end
    else
      nil
    end
  end
