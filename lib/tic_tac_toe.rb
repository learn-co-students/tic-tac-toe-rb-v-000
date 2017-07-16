
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

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def input_to_index(user_input)
   a = user_input.to_i
   a - 1
end

def move(board, index, char)
   board[index] = char
end


def position_taken?(board, index)
  if
    !(board[index].nil? || board[index] == " " || board[index] == "")
    true
  else
    false
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  m = valid_move?(board, index)
  if m == true
    move(board, index, current_player(board))
  else m == false
    until m == true
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      m = valid_move?(board, index)
    end
  end
  puts display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |character|
    if  character == "X" || character == "O"
      counter += 1
    end
  end
return counter
end

def current_player(board)
  number = turn_count(board)
  if number.even? == true
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

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
end
end


def full?(board)
  if
    board.all? {|element| element == "X" || element == "O"}
    true
  elsif board.all? {|element| !element == "X" || element == "O"}
    false
end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
 won?(board) || full?(board)
end

def winner(board)
  if winning_combination = won?(board)
    board[winning_combination.first]
  end
end

def play(board)
    until over?(board) == true
        turn(board)
          end
    if draw?(board) == true
      puts "Cats Game!"
    elsif winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    end
end
