WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
]

board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(number)
  number.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end


def position_taken?(board, index)
  index.to_i - 1
  if board[index] == "X"
    true
  elsif board[index] == "O"
    true
  elsif board[index] == " " or ""
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

def turn (board)
  puts "Please enter 1-9:"
  num = gets.strip
  index = input_to_index(num)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
        turn(board)

 end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even? #% 2 == 0
    "X"
  else turn_count(board).odd? #% 2 == 1
    "O"
  end
end

def won? (board)
  WIN_COMBINATIONS.find do |w|

    win_index_1 = w[0]
    win_index_2 = w[1]
    win_index_3 = w[2]
    board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] &&  position_taken?(board, win_index_1)
  end
end

def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end


def draw?(board)
  full?(board) && !won?(board)
end

def over? (board)
  if draw?(board)
    true
  elsif won?(board)
    true
  else
    false
  end
end


def winner (board)
  if won?(board)
    board[won?(board)[0]]
  end
end


def play(board)
 while !over?(board)
     turn(board)

  end
  if winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
