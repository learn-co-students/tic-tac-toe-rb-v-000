
require_relative '../lib/tic_tac_toe'

puts "Welcome to Tic Tac Toe!"
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  play(board)

  _______________________________________________________

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# defines a constant with arrays for each win condition
win_conditions = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
]

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

def valid_move?(board, position)
  index = position.to_i
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index] == " ")
end

def move(board, position, token)
  index = position.to_i
  board[index] = token
  display_board(board)
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  index = input_to_index(position)
  if valid_move?(board, index) == true
   move(board, index, current_player(board))
   board
 else valid_move?(board, index) == false
   turn(board)
 end
end

def play(board)
  counter = 0
until counter == 9
  turn(board)
  counter += 1
end
end

def turn_count(board)
counter = 0
board.each do |index|
  if index != " "
    counter += 1
  end
end
counter
end

def current_player(board)
 if turn_count(board) % 2 == 0
   return "X"
 else
   return "O"
end
end

WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #horizontal middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #left diagonal
  [2, 4, 6]  #right diagonal
  ]

  def won?(board)
    board.all? {|i| i != " " || i != ""}
    winning_array = WIN_COMBINATIONS.detect do |win_array|
      if win_array.all? {|position| board[position] == "X" } == true
        winning_array.to_s
      elsif win_array.all? {|position| board[position] == "O" } == true
        winning_array.to_s
      end
    end
  end

  def full?(board)
    board.none? {|i| i == "" || i == " "}
  end

  def draw?(board)
     won?(board) == nil && full?(board) == true
  end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if draw?(board) == true
      puts "Cat's Game!"
  else puts "Congratulations #{winner(board)}!"
  end
end
