WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8], #right column win
  [0,4,8], #left diagonal win
  [2,4,6] #right diagonal win
]
# Helper Methods
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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] =="")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index) ? true:false
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "invalid"
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space != " "
      count += 1
    end
  end
  return count
end

def current_player(board)
  turn_count(board).even? ? "X": "O"
  #This is the ternary way of writing where if it is true it will
  #do the left of the colon and if not true, then the right.
end

def won?(board)
  WIN_COMBINATIONS.detect do |position|
    if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
      position
    elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
      position
    else
      false
    end
  end
end

def full?(board)
  board.all? do |pos|
    pos == "X" || pos == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  winning_play = won?(board)
  if winning_play
    board[winning_play.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
