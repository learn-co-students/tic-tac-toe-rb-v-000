WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [2,4,6], #diagonal up
  [0,4,8] #diagonal down
]
# board = [" "," "," "," "," "," "," "," "," "] I put this in bin file.

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, user_input, token)
  board[user_input] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index - 1
  if index.between?(0,8) != position_taken?(board,index)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "O" || turn == "X"
      counter += 1
      # puts "This is turn number #{counter}."
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board) #returns the winning board array index, e.g. [0,1,2] for a top row win.
    WIN_COMBINATIONS.find do |wins|
      board[wins[0]] == board[wins[1]] && board[wins[0]] == board[wins[2]] && position_taken?(board, wins[0])
  end
end

def full?(board)
  WIN_COMBINATIONS.all? do |wins|
    position_taken?(board, wins[0])
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end


def winner(board) #returns "X" or "O"
  if !won?(board)
  else board[won?(board).first]
  end
end

#until the game is over
#   take turns
# end
#if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it has been a draw
# end

def play(board)
  until over?(board)
    turn(board)
  end #end until loop before beginning new condition.
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
