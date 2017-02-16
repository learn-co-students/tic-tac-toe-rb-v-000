#tic-tac-toe
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #left diagonal
  [2,4,6]  #right diagonal
]

def display_board(board)
  row0 = " #{board[0]} | #{board[1]} | #{board[2]} "
  row1 = " #{board[3]} | #{board[4]} | #{board[5]} "
  row2 = " #{board[6]} | #{board[7]} | #{board[8]} "
  lines = '-----------'
  puts row0, lines, row1, lines, row2
end

def input_to_index(input)
  input.to_i - 1
end

#def move(board, index, char = "X")
def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  if  board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " " || board[index] == "" || board[index] == nil
   false
 end
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " " || board[index] == "" || board[index] == nil
   false
 end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
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
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count {|entry| entry == "X" || entry == "O"}
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  if board.all? {|element| element == " "}
    false
  else
    WIN_COMBINATIONS.each do |win_combination|
      if board[win_combination[0]] != " " && (board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]])
        return win_combination
      end
    end
    false
  end
end

def full?(board)
  if board.all? {|element| position_taken?(board, board.index(element))}
    true
  else
    false
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) != false || full?(board)
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) || draw?(board)
    turn(board)
  end
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  end
  if draw?(board)
    puts "Cats Game!"
  end
end
