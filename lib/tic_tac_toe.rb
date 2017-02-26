
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
   [6,7,8],  #Last row
  [0,4,8],  # Top left to bottom right
  [2,4,6],  # Top right to bottom left
  [0,3,6],  # First Column
  [1,4,7],  #Middle column
  [2,5,8] # 3rd column
]


def display_board (board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts     "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts  "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
input.to_i - 1
end

def move (board, index, value)
board[index] = value
end

def position_taken?(board, index)

    if board[index] == " " || board[index] == ""
      false
    elsif board[index] == nil
      false
    elsif board[index] != " " || board[index] != ""
      true
    else
      nil

    end
end


def valid_move?(board, index)
  if index < 0 || index > 8
        false
     elsif position_taken?(board, index)
        false
     else
       true
   end
end


def turn(board)
  input = gets.chomp
  index = input_to_index(input)
  puts "Please enter 1-9:"
    if valid_move?(board,index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  counts = 0
  board.each do |position|
  counts += 1 if position == "X" || position == "O"

  end
  counts
end

def current_player (board)
  if turn_count(board).even?
      "X"
    else
      "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

    if board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && board[win_index_1] != " "
    return win_combination
    end
  end
  false
end


def full?(board)
  board.all? do |full_board|
    if full_board == "X" || full_board == "O"
     full_board
    end
  end
end

def draw?(board)
 !won?(board) && full?(board)
end

def over?(board)
won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winner_board = won?(board)
    board[winner_board.first]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cats Game!"
  end
end
