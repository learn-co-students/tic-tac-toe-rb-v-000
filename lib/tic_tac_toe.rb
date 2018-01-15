def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2] } "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board,index,player)
  board[index] = player
end

def position_taken?(board,index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board,index)
  if index.between?(0, 8) == true && position_taken?(board,index) == false
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  player = current_player(board)
   if valid_move?(board,index) == true
    move(board,index,player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    else
      counter += 0
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else turn_count(board).odd?
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    index_1 = win_combination[0]
    index_2 = win_combination[1]
    index_3 = win_combination[2]

    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]

    position_1 == position_2 && position_2 == position_3 && position_taken?(board, index_1)
  end
end

def full?(board)
  WIN_COMBINATIONS.all? do |space|
    index_1 = space[0]
    index_2 = space[1]
    index_3 = space[2]

    board[index_1] != " " && board[index_2] != " " && board[index_3] != " "
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    true
  else
    false
  end
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  else
    false
  end
end

def winner(board)
  result = won?(board)
  if result
    winning_index_position = result[2]
    board[winning_index_position]
  end
end

def play(board)
  #checks to see if game is over?
  until over?(board)
  #if not over calls turn method
  turn(board)
end
  #after #turn is called, checks to see if the game has been won?
    if won?(board)
  #if game is won, prints "Congrats"
  puts "Congratulations #{winner(board)}!"
  #otherwise checks to see if game is a draw?
else   draw?(board)
  #if game is draw prints "draw"
  puts "Cat's Game!"
end
  #if game is neither won nor drawn fires #turn again
 end
