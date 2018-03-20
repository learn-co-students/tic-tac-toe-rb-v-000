WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column
  [2, 5, 8], #Right column
  [0, 4, 8], #left diagonal
  [2, 4, 6]  #Right diagnal
]

board = [" "," "," "," "," "," "," "," "," "]

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


def move(board, index, current_player)
  board[index] = current_player
end


def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end


def turn(board)
puts "Please enter 1-9:"
  user_input = gets.strip
  input_to_index(user_input)

  index = user_input.to_i - 1
  if valid_move?(board, index)
    move(board, index, current_player(board))

    display_board(board)
  else
        turn(board)
      end
    end


def turn_count(board)
  counter = 0
  board.each do |turn|
    if (turn == "X")||(turn == "O")
    counter += 1
    end
  end
  counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
      if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
    return win_combination
  else
    false
    end
  end
end


def full?(board)
  board.all? do |index|
    if index == " "
       false
     else
       true
    end
  end
end


def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end


def over?(board)
  if won?(board) ||full?(board) ||draw?(board)
    true
  else
    false
  end
end


def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|
      if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
        return "X"
        elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
        return "O"
      else
    end
  end
end


def play(board)
  until over?(board)
  turn(board)
end
if won?(board)
  puts"Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cat's Game!"
  end
end
