WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Center column
  [2,5,8], #Right column
  [0,4,8], #Top-left to bottom-right
  [2,4,6] #Top-right to bottom-left
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(position)
  position.to_i - 1
end

def move(board, position, token)
  board[input_to_index(position)] = token
end

def position_taken?(board, position)
  if board[position.to_i] == "X" || board[position.to_i] == "O"
    true
  else board[position.to_i] == " " || board[position.to_i] == "" || board[position.to_i] == nil
    false
  end
end

def valid_move?(board, position)
  if (position.to_i).between?(1, 9) == true && position_taken?(board, input_to_index(position)) == false
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(board, position) == true
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  itemNum = 0
  counter = 0
  board.each do |item|
    if board[itemNum] != " "
      counter += 1
    end
    itemNum += 1
  end
  counter
end

def current_player(board)
  if turn_count(board).even? == true
    "X"
  else
    "O"
  end
end

def won?(board)
  winning_combination = []
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X") ||
      (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      winning_combination = win_combination
    end
  end
  if winning_combination == []
    false
  else
    winning_combination
  end
end

def full?(board)
  board.all? do |position|
  position != " "
  end
end

def draw?(board)
  if won?(board) == true
    winner(board)
  elsif full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
    true
  elsif full?(board) == true || draw?(board) == true
    puts "Cats Game!"
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    token = won?(board)[0]
    board[token]
  else
    nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
end
