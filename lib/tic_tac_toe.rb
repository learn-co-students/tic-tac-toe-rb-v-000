WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
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

def move(board, index, input)
  board[index] = input
end

def position_taken?(board, index)
 if (board[index] ==  " " || board[index] == "" || board[index] == nil)
  false
else
  true
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
   puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board,index)
      move(board,index,current_player(board))
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  counter = 0
  board.each do |mark|
    if mark == "X" || mark == "O"
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

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O" ||
      board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
  end
end
false
end

def full?(board)
  if board.all? { |fill| fill == "X" || fill == "O" }
    return true
  end
  false
end

def draw?(board)
  if full?(board) && won?(board) == false
    return true
  end
  false
end

def over?(board)
  if full?(board)
    return true
  elsif won?(board) || draw?(board)
    return true
  end
  false
end

def winner(board)
  winner = won?(board)
   if winner
     board[winner[0]]
   else
     nil
   end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
