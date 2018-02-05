
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #right diagonal
  [2,4,6] #left diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if position_taken?(board, index)
    return false
  elsif index >= 0 && index <= (board.length-1)
    return true
  end
end

def turn(board)
  token = current_player(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board, index)
    puts "That's not a valid move. Please try again."
    input = gets.strip
    index = input_to_index(input)
  else
    move(board, index, token)
  end
  display_board(board)
end

def turn_count(board)
  taken_positions = board.select do |position|
    !(position.nil? || position == " ")
  end
  return taken_positions.length
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) %2 == 1
    return "O"
  end
end

def won?(board)
  exes = []
  ohs = []
  board.each_with_index do |space, index|
    if space == "X"
      exes << index
    end
    if space == "O"
      ohs << index
    end
  end
  ex_win = WIN_COMBINATIONS.select do |win_combination|
    (win_combination - exes).empty?
  end
  oh_win = WIN_COMBINATIONS.select do |win_combination|
    (win_combination - ohs).empty?
  end
  if !ex_win.empty?
    return ex_win[0]
  elsif !oh_win.empty?
    return oh_win[0]
  else
    return false
  end
end

def full?(board)
  board.all?{|space| space == "X" || space == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
