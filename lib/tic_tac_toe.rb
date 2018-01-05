WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input = input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  return !(board[index] == " " || board[index] == "" || board[index] == nil)
end

def valid_move?(board, index)
  if position_taken?(board, index) == true || index < 0 || index > 8
    #puts "Can't move there. Please try again."
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
<<<<<<< HEAD
=======
    play(board)
>>>>>>> 4f9da5f7298cbc2197d33b988d23d7b57c43b1a9
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    if board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X" ||
      board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
      return win_array
    end
  end
  false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O" }
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  # if any of the below are true, will return true. Else returns false by default
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    win_array = won?(board)
    board[win_array[0]]
  else
    nil
  end
end

def play(board)
<<<<<<< HEAD
  while !over?(board)
    turn(board)
  end
  if won?(board)
=======
  if !over?(board)
    turn(board)
  elsif won?(board)
>>>>>>> 4f9da5f7298cbc2197d33b988d23d7b57c43b1a9
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
