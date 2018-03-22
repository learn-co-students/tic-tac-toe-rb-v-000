board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (index)
 index = index.to_i
 index = index - 1
end

def move (board, index, value)
  board[index.to_i] = value
end

def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    return false
  else #(board[index] == "X" || board[index]== "O")
    return true
  end
end

def valid_move?(board, index)
if index.between?(0,8) && !position_taken?(board, index)
  return true
else
  false
  end
end

def turn (board)
  puts "Please enter 1-9:"

  input = gets.strip
  index = input_to_index(input)
  value = current_player(board)
  if valid_move?(board, index)
     move(board,index,value)
     display_board(board)
   else
     turn(board)
   end
   puts "Please enter 1-9:"
 end

 def turn_count(board)
   count = 0
   board.each do |move|
     if move == "X" || move == "O"
       count += 1
     end
   end
   count
 end

 def current_player(board)
   turn_count(board).even? ? "X" : "O"
 end

 def won?(board)
   WIN_COMBINATIONS.find do |win_combo|
     board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] && position_taken?(board, win_combo[1])
   end
 end

 def full?(board)
 board.none? do |full_board|
   full_board == " " || nil
   end
 end

 def draw?(board)
   won?(board) == nil && full?(board) == true
 end

 def over?(board)
     draw?(board) == true || won?(board) != nil
 end

 def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
 end
 def play(board)
   until over?(board) == true
     turn(board)
   end
   if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board) == true
    puts "Cat's Game!"
   end
 end
