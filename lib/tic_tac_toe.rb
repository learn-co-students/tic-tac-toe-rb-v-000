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


def position_taken?(board, index)
  if  board[index] == " " || board[index] == "" || board[index] == nil
   board[index] = !true
 else
   board[index] = true
 end
end

def valid_move?(board, index)
  index.to_i.between?(0, 8) && position_taken?(board, index.to_i) == false
end

def move(board, index, player_token)
  board[index] = player_token
  board
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip.to_i-1
    if valid_move?(board, input)
      move(board, input, current_player(board))
    else
      turn(board)
    end
    display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |turns|
    if turns == "X" || turns == "O"
    counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left col
  [1,4,7], # Middle col
  [2,5,8], # Right col
  [0,4,8], # Diag Right
  [2,4,6] # Diag Left
]

# Define your WIN_COMBINATIONS constant
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
end

def full?(board)
  if board.any? do |i|
    i == " " || i == nil
    end
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end


def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else 
    puts "Cats Game!"
  end
end
