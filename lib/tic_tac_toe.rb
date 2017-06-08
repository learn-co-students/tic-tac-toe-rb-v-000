WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #left diagonal
  [2, 4, 6]  #right diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

#convert user's selection of board position to indices
def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

#checks if position is occupied; false if free
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#is the position on the board 1-9? and is it open?
def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

def turn_count(board)
  counter = 0;
  board.each do |square|
    if (square.include? "X") || (square.include? "O")
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

#turn = user input of 1-9, receiving input, coverting input, checking if it is valid,
#making the move, and displaying the board. Otherwise, ask for new position until valid.
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  turn_count(board)

  if valid_move?(board, index) && turn_count(board).even?
    move(board, index, current_player = "X")
    display_board(board)
  elsif valid_move?(board, index) && turn_count(board).odd?
    move(board, index, current_player = "O")
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |array|
    board[array[0]] == board[array[1]] && board[array[1]] == board[array[2]] && position_taken?(board, array[0])
  end
end

def full?(board)
  board.all? do |square|
    square == "X" || square == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end

#ask players' input after each turn until game is #over via #draw, #won
def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
