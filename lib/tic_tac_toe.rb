board = [" "," "," "," "," "," "," "," "," "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


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

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 =="X" && position_3 == "X") ||
       (position_1 == "O" && position_2 =="O" && position_3 == "O")
      return combo
    end
  end
  false
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def full?(board)
  check = true
  board.each do |spot|
  if !(spot == "X" || spot == "O")
    check = false
    end
  end
  check
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
  board.each do |slot|
    if (slot == "X" || slot == "O")
      counter += 1
    end
  end
  counter
end

def current_player(board)
  player = "O"
  if turn_count(board) % 2 == 0
    player = "X"
  end
  player
end


def draw?(board)
  if (full?(board) && !(won?(board)))
    true
  else
    false
  end
end

def over?(board)
  if (draw?(board) || full?(board) || won?(board))
    true
  else
    false
  end
end

def winner(board)
  if (won?(board))
    if (board[won?(board)[0]] == "X")
      "X"
    elsif (board[won?(board)[0]] == "O")
      "O"
    end
  end
end

def play(board)
  while !(over?(board))
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
