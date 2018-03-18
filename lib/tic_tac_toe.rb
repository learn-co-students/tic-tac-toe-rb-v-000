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

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def input_to_index(input)
  index = input.to_i - 1
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def move(board, index, token)
    board[index] = token
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input.to_i - 1
  if valid_move?(board, index)
     move(board, index, current_player(board))
  else display_board(board)
    input = gets.strip
    index = input.to_i - 1
end
end


def turn_count(board)
  turn = 0
  board.each do |move|
    if move == "X" || move == "O"
      turn += 1
    end
  end
  turn
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  false
end


def full?(board)
  board.all? do |letter|
    if letter == "O" || letter == "X"
      true
    end
  end
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if won?(board) && position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
    elsif won?(board) && position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O"
    end
  end
  nil
end

def play(board)
  until over?(board)
    turn(board)
  end
   if won?(board)
      puts "Congratulations #{winner(board)}!"
   else draw?(board)
      puts "Cat's Game!"
    end
end
