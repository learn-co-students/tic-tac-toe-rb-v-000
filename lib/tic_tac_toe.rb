# rspec spec/01_tic_tac_toe_spec.rb

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  input.to_i
  index = input.to_i - 1
end


def move(board, index, char)
  board[index] = char
  return board
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  board.each do |element|
    if element == "X" || element == "O"
    counter += 1
    end
  end
  return counter
end


def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return win_combination
    elsif
      board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return win_combination
    end
  end
  else
    return false
end



def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end



def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  end
else
  return false
end


def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return "X"
    elsif
      board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return "O"
    end
  end
    else
      return nil
end


# rspec spec/02_play_spec.rb

def play(board)
  until over?(board) == true
    turn(board)
  end
  if winner(board) == "X"
    return "Congratulations X!"
  elsif winner(board) == "O"
    return "Congratulations O!"
  else
    return "Cats Game!"
  end
end
