win1 = [0,1,2]
win2 = [3,4,5]
win3 = [6,7,8]
win4 = [0,3,6]
win5 = [1,4,7]
win6 = [2,5,8]
win7 = [0,4,8]
win8 = [6,4,2]
WIN_COMBINATIONS = [win1, win2, win3, win4, win5, win6, win7, win8]

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

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
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
  board.each do |position|
    unless position == "" || position == " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  unless turn_count(board) % 2 == 0
    "O"
  else
    "X"
  end
end

def won?(board)
  current = []
  someone_won = false
  WIN_COMBINATIONS.each do |win|
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      someone_won = true
      current = [win_index_1, win_index_2, win_index_3]
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      someone_won = true
      current = [win_index_1, win_index_2, win_index_3]
    else
      false
    end
  end
  if someone_won
    current
  else
    false
  end
end

def full?(board)
  if board.all? {|draw| draw == "X" || draw == "O"}
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if full?(board) == true || won?(board) != false
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
    nil
  else
    current = won?(board)
    board[current[1]]
  end
end

def play(board)
  count = 1
  while count < 10 && draw?(board) == false && over?(board) == false
    count += 1
    turn(board)
  end
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
