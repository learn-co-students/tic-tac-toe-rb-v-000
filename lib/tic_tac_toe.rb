
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
   index = user_input.to_i
   index = index - 1
end

def move(board, index, character)
   board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] ==nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
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
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |index|
   if index=="X" || index=="O"
   counter += 1
   end
  end
  counter
end

def current_player(board)
  turn_count(board)
  if turn_count(board).even?
  "X"
  else
  "O"
end
end

def won?(board)
  win = nil
  WIN_COMBINATIONS.each do | win_combination |
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
     if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X")
      win = win_combination
     elsif (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      win = win_combination
     else
      false
     end
   end
  win
end

def full?(board)
   if board.include?(" ")
    false
   else board.include?("X" || "O")
    true
   end
end

def draw?(board)
  if won?(board)
    false
  elsif !full?(board)
    false
  else full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end


def winner(board)
  win = won?(board)
  win ? board[win[0]] : nil
end


def play(board)
  while !over?(board)
    turn(board)
end

  if draw?(board)
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
 end
end
