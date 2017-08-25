puts "Welcome to Tic Tac Toe!"

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def play(board)
  until over?(board)
    current_player(board)
    turn(board)
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

def valid_move?(board, index)
  if !position_taken?(board, index) && (index).between?(0, 8) == true
    return true
  else false
  end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else return true
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def turn(board)
    puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if !valid_move?(board, index)
    turn(board)
  else move(board, index, current_player(board))
    end
    display_board(board)
end

def move(board, index, current_player)
  board[index] = current_player
end

def turn_count(board)
    counter = 0
    board.each do |turn|
      if turn == "X" || turn == "O"
        counter +=1
end
end
return counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else turn_count(board).odd?
    return "O"
  end
end

WIN_COMBINATIONS = [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
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
end
def full?(board)
  if board.detect {|i| i == " " || i = nil}
  return false
else
  true
end
end
def draw?(board)
  if !won?(board) && full?(board)
  return true
else
  return
  false
end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else false
end
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
end
end

if won?(board)
  puts "Congratulations #{winner(board)}!"
else
  puts "Cat's Game!"
end
end
