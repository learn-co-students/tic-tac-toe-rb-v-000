WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, index, token)
  board[index.to_i-1] = token
end


def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else board[index] != "" || board[index] != "" || board[index] != nil
    return true
end

def valid_move?(board, index)
   index.to_i.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
  turn(board)
end
end


def turn_count(board)
  counter = 0
  board.each do |count|
    if count == "X" || count == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
if turn_count(board).even?
 "X"
 else turn_count(board).odd?
 "O"
end

def play(board)
  until over?(board)
  take turns
end
if won?(board)
  "Congratulations!"
else draw?(board)
  "Cat's Game!"
end

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
   end
end
  false
end

def full?(board)
  board.none? { |position| position == " " }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  until won?(board)
 position = won?(board)
 position.each do |win|
  end
  if board[win] == "X"
   return "X"
 else
   return "O"
 end
end
