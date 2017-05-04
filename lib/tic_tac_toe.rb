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
  input = gets
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def turn_count(board)
  turn = 0
  board.each do |mark|
    if(mark == "X" || mark == "O")
      turn += 1
    end
  end
  return turn
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  win_combo = [" "," "," "]
  WIN_COMBINATIONS.each do |combo|
    if((board[combo[0]] == "X" &&
      board[combo[1]] == "X" && board[combo[2]] == "X") ||
      (board[combo[0]] == "O" &&
        board[combo[1]] == "O" && board[combo[2]] == "O"))
      win_combo[0] = combo[0]
      win_combo[1] = combo[1]
      win_combo[2] = combo[2]
      return win_combo
    end
  end
  return nil
end

def full?(board)
  board.each do |cell|
    if(cell != "X" && cell != "O")
      return false
    end
  end
  return true
end

def draw?(board)
  if(!won?(board) && full?(board))
      return true
  end
  return false
end

def over?(board)
  if(won?(board) || draw?(board))
    return true
  end
  return false
end

def winner(board)
  win_combo = won?(board)
  if(win_combo != nil)
    return board[win_combo[0]]
  end
  return nil
end


def play(board)
  until over?(board)
    turn(board)
  end

  if(won?(board))
    puts "Congratulations #{winner(board)[0]}!"
  else
    puts "Cats Game!"
  end
end

#board = [" "," "," "," "," "," "," "," "," "]
#puts "Welcome to Tic Tac Toe"
#play(board)
