WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
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

def move(board, index, value)
  board[index] = value
  board
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please choose between spaces 1-9:"
  choice = gets.strip
  index = input_to_index(choice)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
  turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
  space == "X" || space == "O" ? counter += 1 : nil
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[0])
    end
end

def full?(board)
  board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  champarray = won?(board)
  if won?(board)
    board[champarray[1]]
  else
    nil
  end
end

def play(board)
  until over?(board) do
  turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
