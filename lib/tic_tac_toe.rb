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

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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
  counter = 0
  board.each do |position|
    if position == "X"
      counter +=1
    elsif position == "O"
      counter +=1
    end
  end
  counter
end

def current_player(board)
  x = turn_count(board)
  x = x % 2
  x == 0 ? "X" : "O"
end


def won?(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X"
    return WIN_COMBINATIONS[0]
  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
      return WIN_COMBINATIONS[0]
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    return WIN_COMBINATIONS[1]
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
    return WIN_COMBINATIONS[1]
  elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
    return WIN_COMBINATIONS[2]
  elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[2]
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
    return WIN_COMBINATIONS[3]
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    return WIN_COMBINATIONS[3]
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
    return WIN_COMBINATIONS[4]
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    return WIN_COMBINATIONS[4]
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
    return WIN_COMBINATIONS[5]
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[5]
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
    return WIN_COMBINATIONS[6]
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[6]
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
    return WIN_COMBINATIONS[7]
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
    return WIN_COMBINATIONS[7]
  else
    return false
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X"
    return "X"
  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
      return "O"
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    return "X"
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
    return "O"
  elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
    return "X"
  elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
    return "O"
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
    return "X"
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    return "O"
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
    return "X"
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    return "O"
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
    return "X"
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    return "O"
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
    return "X"
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
    return "O"
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
    return "X"
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
    return "O"
  else
    return nil
  end
end

def play(board)
  display_board(board)
  until over?(board)
    turn(board)
    end
  if draw?(board)
    puts "Cat's Game!"
  end
  if over?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
