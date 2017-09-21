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

board = ["", "", "","", "", "","", "", ""]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def valid_move?(board, index)
  if position_taken?(board, index)
  return false
elsif index.between?(0,8)
    return true
  else
    return false
  end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else return true
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end



def move(board, user_input, value)
  board[user_input] = value
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
     move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      puts "#{counter}"
    end
  end
  counter
end


def current_player(board)
  if turn_count(board).even?
    return "X"
  elsif  turn_count(board).odd?
    return "O"
  else
    return "O"
  end
end


def won?(board)
 WIN_COMBINATIONS.detect do |win|
   board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]] && position_taken?(board, win[1])
 end
end

def full?(board)
 full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
 if full_board == board
   return true
 else
   return false
end
end

def draw?(board)
  draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  won?(board)
  full?(board)
  if board == draw_board
    return true
  elsif won?(board) == board
    return false
  else return false
end
end

def over?(board)
  draw?(board) || won?(board)

end

def winner(board)
  if win = won?(board)
    return board[win[0]]

  else
    return nil
end
end

def play(board)
 while !over?(board)
   turn(board)
 end
 if won?(board)
  puts "Congratulations #{winner(board)}!"
else
  puts "Cats Game!"
 end
end
