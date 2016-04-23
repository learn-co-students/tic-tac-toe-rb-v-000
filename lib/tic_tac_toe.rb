#require 'pry'
WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move (board,location,icon = "X")
  point = location.to_i - 1
  return board[point] = icon
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def valid_move?(board,index)
  spot = index.to_i
  if spot.between?(1,9) and !position_taken?(board,spot - 1) then
    return true
  else
    return false
  end
end

def turn_count(board)
  counter = 0
  board.each do |player|
    if player == "X" or player == "O" then
      counter += 1
    end
  end
    return counter
 end

def current_player(board)
  if turn_count(board).even? then
    return "X"
  else
    return "O"
  end
 end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] && board[win[1]] ==  board[win[2]] && position_taken?(board,win[0])
  end
end

def full?(board)
 board.all? do |number|
   number == "X" || number == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
   if won?(board)
    board[won?(board)[0]]
  end
end

def turn(board)
  puts "Please enter 1-9:"
  spot = gets.chomp
  if valid_move?(board,spot) then
    move(board,spot,current_player(board))
    display_board(board)
  else
    puts "Invalid move, try again"
    turn(board)
  end
end

def play(board)
  #binding.pry
 until over?(board) || draw?(board) do
    turn(board)
 end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 elsif draw?(board)
   puts "Cats Game!"
 end
end


