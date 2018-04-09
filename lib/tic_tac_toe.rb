WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your play method below
def play(board)
  counter = 0
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
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

def input_to_index(user_input)
  user_input.to_i - 1
end

def current_player(board)
  turns = turn_count(board)
  if (turns.even?)
    return "X"
  end
  if (turns.odd?)
    return "O"
  end
end

def turn_count(board)
  counter = 0
  board.each do |item|
    if !(item == " ")
      counter += 1
    end
  end
  return counter
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def move(board, index, current_player)
  board[index] = current_player
end

def full?(board)
  board.none?{ |e| e == " "}
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |item|
    if board[item[0]] == "X" && board[item[1]] == "X" && board[item[2]] == "X"
      return item
    elsif board[item[0]] == "O" && board[item[1]] == "O" && board[item[2]] == "O"
      return item
    end
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  who_won = won?(board)
  if who_won
    return board[who_won[0]]
  else
    return nil
  end
end
