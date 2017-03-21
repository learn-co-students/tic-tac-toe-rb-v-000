WIN_COMBINATIONS = [
  [0,1,2], #top
  [3,4,5], #middle
  [6,7,8], #bottom
  [0,4,8], #left cross
  [2,4,6], #right cross
  [0,3,6], #left line
  [2,5,8], #right line
  [1,4,7] #center line
]

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken? (board, index)
  if board[index] == "  " || board[index] == " " ||  board[index] == nil ||  board[index] == ""
    return false
  else
    return true
  end
end

def input_to_index (input)
  index = input.to_i - 1
end

def move (array, index, value)
  array[index] = value
end

def valid_move? (board, index)
  if position_taken?(board,index) == false
    if index.between?(0,8)
      return true
    end
    else
    return false
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn != " "
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn = turn_count(board)
  if turn.even?
   return "X"
  elsif turn.odd?
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index, value)
    display_board(board)
  else
     turn(board)
  end
end


def won? (board)
  WIN_COMBINATIONS.find do | pattern |
    board[pattern[0]] == board[pattern[1]] && board[pattern[1]] == board[pattern[2]] &&
    position_taken?(board, pattern[0])
   end
end

def full? (board)
  board.all? do | position |
     position != " "
  end
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner (board)
  if win_result = won?(board)
     board[win_result[0]]
  end
end


def play(board)
  while over?(board) == false
    turn(board)
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else draw?(board)
    puts "Cats Game!"
  end
end