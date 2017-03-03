require 'pry'
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left columns
  [1, 4, 7], #middle columns
  [2, 5, 8], #right columns
  [0, 4, 8], #diagonal 1
  [2, 4, 6] #diagonal 2
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

def move(board, index, value)
  board[index] = value
end

def position_taken?(array, index)
  if array[index] == " " || array [index] == "" || array == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  input_to_index(user_input)
  index = input_to_index(user_input)
  if valid_move?(board, index)
    value = current_player(board)
    move(board, index, value)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |player|
    if player == "X" || player == "O"
    count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board).odd?
    current_player = "O"
  else
    current_player = "X"
  end
end

def won?(board)
    WIN_COMBINATIONS.detect {|combo| board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" || board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"}
end

def full?(board)
  board.none? {|play| play == nil || play == " "}
end

def draw?(board)
  is_full = full?(board)
  isnt_won = !won?(board)
  is_full && isnt_won
end

def over?(board)
  # if full?(board) == true
  #   return true
  # end
  draw?(board) || won?(board)
end

def winner(board)
  if WIN_COMBINATIONS.any? {|combo| board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"} == true
    return "X"
  elsif WIN_COMBINATIONS.any? {|combo| board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"} == true
      return "O"
  else
    return nil
  end
end

def play(board)
  # until over?(board) == true
  #   turn(board)
  #   over?(board)
  turn(board) until over?(board)

    if winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    else
      puts "Cats Game!"
    end
  end
