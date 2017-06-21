WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def current_player(board)
  if turn_count(board)%2 == 0
    return 'X'
  else
    return 'O'
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  return false
end


def full?(board)
   board.all?{|i| i == 'X' || i == 'O'}
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def over?(board)
  if won?(board) || draw?(board)|| full?(board)
    return true
  end
  return false
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
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

def turn_count(board)
  turnsTaken = board.select do |i|
    i == 'X' || i == 'O'
  end
  return turnsTaken.length
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def winner(board)
  if won?(board)
    combination = won?(board)
    return board[combination[0]]
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all?{|i| position_taken?(board, i)} && (combination.all?{|i| board[i]== 'X'} || combination.all?{|i| board[i]== 'O'})
      return combination
    end
  end
  return false
end
