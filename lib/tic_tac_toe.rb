
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

  if over?(board) && won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end

 end

def turn_count(board)
  counter = 0
  board.each do |move|
    if move == "X" || move == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)

  if turn_count(board).even? == true
    "X"
  else
    "O"


  end
end

def won?(board)

 WIN_COMBINATIONS.find do
  |combo|

  position_1 = board[combo[0]]
  position_2 = board[combo[1]]
  position_3 = board[combo[2]]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    combo
  else
    false
  end
 end
end

def full?(board)
  board.all? do |space|
     space == "X" || space == "O"
  end
end

def draw?(board)

  if full?(board) == true && won?(board) == nil || won?(board) == false
    true

  end
end

def over? (board)

 if won?(board) || draw?(board)
  true
 else
  false
 end
end

def winner (board)

 combo = won?(board)

 if combo
   board[combo[0]]
 end
end
