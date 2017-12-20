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

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  board[index] != " "
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
  board.each do |move|
    if move == "X" || move == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board)
  if  turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if win_combination.all? {|index| board[index] == "X"}
      return win_combination
    elsif win_combination.all? { |index| board[index] == "O"}
      return win_combination
    else
      false
    end
  end
end


def full?(board)
board.none? { |board| board == "" || board == " " || board == nil }
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  if won?(board)
    win_check = won?(board)
    return board[win_check[0]]
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
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
