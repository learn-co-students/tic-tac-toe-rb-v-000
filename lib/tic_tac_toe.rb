require "pry"
WIN_COMBINATIONS = [
[0, 1, 2], [3, 4, 5],
[6, 7, 8], [0, 4, 8],
[2, 4, 6], [0, 3, 6],
[1, 4, 7], [2, 5, 8],
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, input, character)
  board[input] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
   if index.between?(0, 8) && !position_taken?(board, index) == true
     true
   else
     false
 end
end

def turn(board)
  puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
if valid_move?(board, index)
 move(board, index, current_player(board))
 print display_board(board)
else
 turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
if turn_count(board).even?
  "X"
else
  "O"
  end
end

def won?(board)
WIN_COMBINATIONS.each do |win_index|
   if board[win_index[0]] == "X" && board[win_index[1]] == "X" && board[win_index[2]] == "X"
      return win_index.to_ary
    elsif board[win_index[0]] == "O" && board[win_index[1]] == "O" && board[win_index[2]] == "O"
      return win_index.to_ary
    end
end
    false
end

def full?(board)
  board.none? { |space|
if space == " "
true
else
  false
end
}
  end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) && full?(board)
    true
  elsif won?(board) && !full?(board)
    true
  elsif draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
   nil
 else
  won?(board).each do |indexes|
    if board[indexes] == "X"
      return  "X"
    elsif board[indexes] == "O"
       return "O"
      end
     end
   end
end

def play(board)
until over?(board)
  turn(board)
   end

   if  winner(board) == "X" && winner(board) != "O"
     puts "Congratulations X!"
   elsif winner(board) == "O"
     puts "Congratulations O!"
   elsif draw?(board)
     puts "Cat's Game!"
   end

end
