
WIN_COMBINATIONS = [
  [0,1,2], #top
  [3,4,5], #Middle
  [6,7,8], #bottom
  [0,3,6], #left vert
  [1,4,7], #middle vertical
  [2,5,8], #right vertical
  [2,4,6], #diagonal
  [0,4,8]  #diagonal
]

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

# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     move(board, index)
#     display_board(board)
#   else
#     turn(board)
#   end
# end



def turn_count(board)
  count = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
   if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
    return combo
   end
  end
  false
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif full?(board) == true && won?(board) != false
    return true
  elsif full?(board) == false && won?(board) != false
    return true
  else
    false
  end
end

def winner(board)
  if winner = won?(board)
    board[winner[0]]
  end
end

def play(board)
  until over?(board) == true do
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

# def play(board)
#   turn = 0
#   until turn == 9
#     turn(board)
#     turn += 1
#   end
# end
