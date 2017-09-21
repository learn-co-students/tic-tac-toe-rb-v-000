#all of our game methods will be coded in here
#helper methods will go in here
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

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
  false
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, position, character)
  board[position] = character
end

def position_taken?(board,index)
  if board[index] == "X" || board[index] == "O"
    return true
  elsif board[index] == " " || board[index] == "" || board[index] == nil
    return false
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(board, index)
    move(board, index, character = current_player(board))
    display_board(board)
  else
    puts "invalid move"
    turn(board)
  end
end

def turn_count(board)
  num_of_turns = 0
  board.each do |array|
    if array == "X" || array == "O"
    num_of_turns += 1
  end
end
  num_of_turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else turn_count(board) % 2 == 1
    "O"
  end
end

def full?(board)
  if board.include?(" ")
    return false
  else
    true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    false
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  else
    false
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
  end

def play(board)
  while !over?(board) && !won?(board) && !draw?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
