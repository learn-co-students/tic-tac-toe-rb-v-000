require 'pry'

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def input_to_index(user_input)
  user_input.to_i - 1 
end

def move(board, index, character)
  board[index]=character 
end 

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if !valid_move?(board, index)
    puts "Invalid entry."
    turn(board)
  end
  move(board, index, current_player(board))
  display_board(board)
end

def turn_count(board)
  turn = 0
  board.each do |index| 
    turn += 1 if index == 'X' || index == 'O'
  end
  
  turn
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    position_1 = board[win_combo[0]]
    position_2 = board[win_combo[1]]
    position_3 = board[win_combo[2]]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  full?(board) == true && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner (board)
  if won?(board)
    winner = board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
       puts "Cat's Game!"
  elsif won?(board)
     puts "Congratulations #{winner(board)}!"
   end
end