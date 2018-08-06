# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Left diagonals
  [2,4,6] # Right diagonals
]

#display_board
def display_board(board)
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end


#input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end

#move
def move(board, index, current_player)
  board[index] = current_player
end

#position_taken?
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#valid_move?
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#turn_count
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

#current_player
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

#won?
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
  false
end

#full?
def full?(board)
  board.all? do |i|
    i != " "
  end
end

#draw?
def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

#over?
def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end

#winner
def winner(board)
  if !won?(board)
    return nil
  else
    won?(board).each do |win_combination|
      if board[win_combination[0]] == "X" &&
      board[win_combination[1]] == "X" &&
      board[win_combination[2]] == "X"
      return "X"
      else return "O"
      end
    end
  end
end

#play
# def play(board)
#   turn(board)
#   over?(board) == false
#   until over?(board) == true
#     turn(board)
#   end
# end

def play(board)
  until over?(board) == true
    turn(board)
  end
  puts "Congratulations X!"
  puts "Congratulations O!"
  if draw?(board) == true
    puts "Cat's Game!"
  end
end

# def play(board)
#   until over?(board) == true
#     turn(board)
#   end
#   if draw?(board) == true
#     puts "Cat's Game!"
#   else
#     if winner(board) == "X"
#       puts "Congratulations X!"
#     else winner(board) == "O"
#        puts "Congratulations O!"
#     end
#   end
# end
