WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Third column
  [0,4,8],  # diagonal 1
  [2,4,6]  # diagonal 2
  #an array for each win combination
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(array, index, token)
  array[index] = token
end

def valid_move?(board,index)
  position_taken?(board,index)== false && index.between?(0,8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = input_to_index(gets.strip)
    if valid_move?(board,input)
      token = current_player(board)
      move(board,input,token)
      display_board(board)
    else turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |box|
    if box == "X" || box == "O"
      counter += 1
    end
  end
      return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    if combination.all? {|i| board[i] == "X"}
        return combination
    elsif combination.all? {|i| board[i] == "O"}
        return combination
    end
  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  #method accepts a board and returns true if the board has not been won and is full
  #and false if the board is not won and the board is not full
  #and false if the board is won.
  won?(board) == nil && full?(board) == true
end

def over?(board)
  # method accepts a board and returns true if the board has been won, is a draw, or is full
  won?(board) != nil || draw?(board) == true || full?(board) == true
end

def winner(board)
  #method should accept a board and return the token, "X" or "O" that has won the game given a winning board.
  if won?(board) != nil
    board[won?(board)[0]]
end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if draw?(board) == true
    puts "Cat's Game!"
  elsif won?(board) != nil
      puts "Congratulations #{winner(board)}!"
  end
end
