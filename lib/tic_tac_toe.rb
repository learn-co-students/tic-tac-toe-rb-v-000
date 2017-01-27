#!/usr/bin/env ruby

require_relative '../lib/tic_tac_toe'

WIN_COMBINATIONS = [
  [0,1,2], # top row win
  [3,4,5], # middle row win
  [6,7,8], # bottom row win
  [0,3,6], # left column win
  [1,4,7], # mid column win
  [2,5,8], # right col win
  [0,4,8], #  diagonal
  [2,4,6] #  diagonal
]
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} \n"

 end

 def position_taken?(board, index)
   if board[index] == (" " || "")
     false
   elsif board[index] == "X"
     true
   elsif board[index] == "O"
     true
   elsif board[index] != ("X" || "O")
     false
   else
   end
 end

 def move(board, user_input, current_player)
   board[user_input] = current_player
   return board
 end

 def input_to_index(user_input)
   user_input = user_input.to_i
   user_input = user_input - 1
 end

 def valid_move?(board, index)
   if index.between?(0,8) && position_taken?(board, index) == false
     true
   else
   end
 end

 def turn(board)
   puts "Please enter 1-9:"
   user_input = gets.chomp
   index = input_to_index(user_input)
   if valid_move?(board, index) == true
     move(board, index, current_player(board))
     display_board(board)
     turn_count(board)
   else
      until over?(board) == true
        turn(board)
      end
   end
 end

 def turn_count(board)
   counter = 0
   for item in board
     if item == "X" or item == "O"
       counter += 1
     end
   end
   return counter
 end


 def current_player(board)
   if turn_count(board).even?
     return "X"
   else
     return "O"
   end
 end

 def won?(board)
   WIN_COMBINATIONS.each do |wincombo|
     if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X"
       return wincombo
     elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O"
       return wincombo
     end
   end
   false
 end

 board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

 board = [[0],[1],[2],[3],[4],[5],[6],[7],[8]]
 def full?(board)
   board.each do |positions|
     if positions == " " || positions == ""
       return false
     else
       true
   end
 end
 end

 def draw?(board)
   if full?(board) == true || won?(board) == false
     return true
   else
   end
 end

 def over?(board)
   if won?(board)
     return true
   elsif full?(board)
     return true
   elsif draw?(board)
     return false
   else
   end
 end

 def winner(board)
   wincombo = won?(board)
   if won?(board)
   return board[wincombo[0]]
   else
   end
 end


def play(board)

until over?(board) do
  turn(board)
end

if won?(board) != false
  puts "Congratulations #{winner(board)}!"
else draw?(board) == true
  puts "Cats Game!"
end
draw?(board)
end
