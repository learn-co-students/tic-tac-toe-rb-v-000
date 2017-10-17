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

board = ["   ", "   ", "   ", "   ", " ", "   ", "   ", "   ", "   "]
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

def move(board, index, user)
  board[index] = user
end

def position_taken?(board, index)
  if board[index] == " "
    return false
  elsif board[index] == ""
    return false
  elsif board[index] == nil
    return false
  else board[index] != " " || board[index] != ""
    return true
  end
end

def valid_move?(board, index)
if (index.to_i).between?(0, 8) == false
  return false
  elsif position_taken?(board, index.to_i)
  return false
else return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  round = 0
    board.each do |player|
      if player == "X" || player == "O"
        round += 1
      end
    end
    round
  end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
end

def full?(board)
  board.all?{|player| player == "X" || player == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if winning = won?(board)
    board[winning.first]
  end
end

def play(board)
  while !over?(board)
    if !draw?(board)
      turn(board)
    end
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
