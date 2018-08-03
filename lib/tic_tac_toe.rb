# Helper Method
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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


def move(board, index, player)
  board[index] = player
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



def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
    counter += 1
  end
end
  counter
end



def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else "O"
end
end



def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
    position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end



def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end



def draw?(board)
  full?(board) && !(won?(board))
end



def over?(board)
  won?(board) || draw?(board)
end



def winner(board)
if won?(board) && board[won?(board)[0]] == "X" && board[won?(board)[1]] == "X" && board[won?(board)[2]] == "X"
    "X"
elsif won?(board) && board[won?(board)[0]] == "O" && board[won?(board)[1]] == "O" && board[won?(board)[2]] == "O"
  "O"
  end
end


def play(board)
  ##I need something where it plays the function of #turn once first, then it sends it into this loop where it keeps playing turn until #over? is true...
 while over?(board) == false
   turn(board)
  end
    if winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    elsif draw?(board) == true
       puts "Cat's Game!"
  end
end
