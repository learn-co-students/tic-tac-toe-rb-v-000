
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "O" || turn =="X"
      counter +=1
    end
  end
  counter
end

def current_player(board)
  player = "X"
  if turn_count(board) % 2 == 0
    player = "X"
  else
    player = "O"
  end
  player
end

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

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

WIN_COMBINATIONS = [
  [0,1,2], #1
  [3,4,5], #2
  [6,7,8], #3
  [0,3,6], #4
  [1,4,7], #5
  [2,5,8], #6
  [0,4,8], #7
  [2,4,6] #8 possible win scenarios
]

def won?(board)
  # board[x] compares to win_combos , and if win_combos[z] all == "x", then return the combo
  WIN_COMBINATIONS.each do |numarray|
    if board[numarray[0]] =="X" && board[numarray[1]] == "X" && board[numarray[2]] == "X" || board[numarray[0]] == "O" && board[numarray[1]] == "O" && board[numarray[2]] == "O"
      return numarray
    # else
    #   continue
    end
  end
  return false
end

def full?(board)
  board.any? do |empty|
    if empty == "" || empty == " "
      return false
    end
  end
    true
end

def draw?(board)
  if won?(board)
    return false
  end
  if full?(board) == false
    return false
  end
  true
end

def over?(board)
  if won?(board) != false || full?(board) == true
    return true
  end
  false
end

def winner(board)
  WIN_COMBINATIONS.each do |numarray|
    if board[numarray[0]] =="X" && board[numarray[1]] == "X" && board[numarray[2]] == "X" || board[numarray[0]] == "O" && board[numarray[1]] == "O" && board[numarray[2]] == "O"
      return board[numarray[0]]
    end
  end
  nil
end
