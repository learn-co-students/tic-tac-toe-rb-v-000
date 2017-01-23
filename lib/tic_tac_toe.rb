WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle columns
  [2,5,8], #right column
  [0,4,8], #left diagonal
  [2,4,6]  #right diagonal
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
  player = current_player(board)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space == "X" || space == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  elsif turn_count(board).odd?
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    # puts "#{win_index_1}, #{win_index_2}, #{win_index_3}"
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if [position_1, position_2, position_3].all? {|i| i == "X"}
      return combo
    elsif [position_1, position_2, position_3].all? {|i| i == "O"}
      return combo
    else
      false
    end
  end
  false
end

def full?(board)
  if board.all? {|index| index == "X" || index == "O"}
    true
  else
    false
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
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]] == "O"
      "O"
    else
      "X"
    end
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
