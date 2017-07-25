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
  row_dashes = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "#{row_dashes}"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "#{row_dashes}"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  return "#{user_input}".to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index)
    false
  elsif index < 0 || index > 8
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player(board)
  if valid_move?(board,index)
    move(board, index, character = player)
    display_board(board)
  else
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
end

def turn_count(board)
  counter = 0
  board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
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
    end
  end
end

def full?(board)
  board.none?{|i| i == nil || i == " " || i == ""}
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  win_index = won?(board)
  if win_index != nil
    return board[win_index[0]]
  else
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
