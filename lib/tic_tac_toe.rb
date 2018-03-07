
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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
  puts " #{board[3]} | #{board[4]} | #{board [5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  updated_input = input.to_i - 1
  index = updated_input
end

def move(board, index, character)
  board[index] = character
end
# code your #valid_move? method here
def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8) == true
    return true
  else
    return false
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
  return true
  end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, character = "X")
      display_board(board)
    else turn(board)
    end
end

def turn_count(board)
  count = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
    count += 1
    end
  end
  return count
end

def current_player(board)
  turn_count(board) % 2 == 0 || turn_count(board) == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if ((position_1 == "X" && position_2 == "X" && position_3 =="X") || (position_1 == "O" && position_2 == "O" && position_3 =="O"))
      return win_combination
    end
  end
  return false
end

def full?(board)
   !(board.include?(" "))
end

def draw?(board)
  if((won?(board) == false) && (full?(board) == true))
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end

def winner(board)
  win_token  = won?(board)
  if win_token
    board[win_token[0]]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
