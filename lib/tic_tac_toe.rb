
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6],
  [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]


def move(board, position, current_player)
  board[position.to_i - 1] = current_player
  true
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(board, position) == true
    move(board, position, current_player(board))
  else turn(board)
  end
  display_board(board)
end


def turn_count(board)
  counter = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      counter += 1
    end
  end
      return counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo| #the 8 nested arrays
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
      combo #returns the winning array of 3 numbers
    else
      false
    end
  end
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if won?(board) || !full?(board)
    false
  else full?(board) && !won?(board)
    true
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  combo = won?(board) # either returns array or nil
  if combo
    board[combo[0]] #returns the token itself. "X" OR "O" No need to overcomplicate things, keep it simple.
  else
    nil
  end
end


# Define your play method below
def play(board)
  until over?(board)
    turn(board)
  end

combo = won?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end