WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
require 'pry'
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

def move(board, input_to_index, player)
  board[input_to_index] = player
end

def position_taken?(board, index)
    !(board[index] == nil || board[index] == "" || board[index] == " ")
end

def valid_move?(board, index)
  if position_taken?(board, index) == true
    return false
  elsif position_taken?(board, index) == false && index.between?(0, 8)
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
    turns
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[2]] == board[win_combo[1]] && board[win_combo[1]] != " "
  end
end

def full?(board)
   board.all? {|space| space != " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  won?(board) ? board[won?(board).first] : nil
end

def play(board)
  until over?(board)
    turn(board)
  end
   if draw?(board)
     puts "Cat's Game!"
   elsif won?(board)
     puts "Congratulations #{winner(board)}" + "!"
   end
 end
