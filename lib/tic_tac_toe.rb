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
  user_input.to_i - 1
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end


def valid_move?(board, index)
  board[index] == " " && index.between?(0, 8)
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def move(array, index, current_player)
  array[index] = current_player
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
  count = 0
  board.each do |space|
    if "#{space}" != " "
      count += 1
      puts count
    end
  end
  count
end


def won?(board)
  WIN_COMBINATIONS.detect do |win_array|
    position_1 = board[win_array[0]]
    position_2 = board[win_array[1]]
    position_3 = board[win_array[2]]

    position_1 == position_2 &&
    position_2 == position_3 &&

    position_taken?(board, win_array[0])

  end
end

def full?(board)
  board.all? do |space|
    space != " "
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board) != nil
    integer = won?(board)[0]
    return board[integer]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
    if full?(board) && !won?(board)
      puts "Cats Game!"
    else
      puts "Congratulations #{winner(board)}!"
  end
end
