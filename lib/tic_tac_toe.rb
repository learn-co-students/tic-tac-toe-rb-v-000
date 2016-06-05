
# Helper Method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def play(board)
  while !over?(board)  do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def turn(board)
  puts "It is your turn.\n"
  puts "Please enter 1-9:"
  index = gets.strip
  index = input_to_index(index)
  move(board,index, current_player(board))
  display_board(board)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def move(board, index, char)
  if valid_move?(board, index)
    board[index] = char
  else
    invalid_move(board)
  end
end

# code your #valid_move? method here
def valid_move?(board,index)
  if index > 9 || index < 0
    return false
  elsif position_taken?(board,index)
    return false
  else
    return true
  end
end

def invalid_move(board)
  puts "That move is invalid!\n"
  turn(board)
end

# code your input_to_index and move method here!
def input_to_index(int)
  return int.to_i - 1
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

## count how many spaces are taken
def won?(board)
  win_set = nil
  win_set = WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
  end
   if win_set == nil
    win_set = WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
    end
  end
  return win_set
end

def full?(board)
  counter = 0
  9.times do |index|
    if position_taken?(board,index)
      counter +=1
    end
  end
  return counter == 9
end

def draw?(board)
  full = full?(board)
  won = won?(board) == nil
  return  full && won
end

def over?(board)
  return draw?(board) || won?(board) != nil
end

def winner(board)
  win_X = WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
  end
  win_Y = WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
  end
  if win_X != nil
    return "X"
  end
  if win_Y != nil
    return "O"
  end
  return nil
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position != "" && position != " " && position != nil
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 1
    # puts "It is O's turn"
    player = "O"
  else
    #puts "It is X's turn"
    player = "X"
  end
  return player
end
