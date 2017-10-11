WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left to right diagonal
  [6,4,2], #Right to left diagonal
]

board = " ", " ", " ", " ", " ", " ", " ", " ", " "
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

def input_to_index(user_input)
  user_input = user_input.to_i
  user_input-=1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (index.between?(0, 8)) && (position_taken?(board, index) == false)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if !valid_move?(board, index)
    turn(board)
  end
    move(board, index, current_player(board))
    display_board(board)
end

def turn_count(turn)
  counter = 0
  move_count = []
  turn.each do |char|
    if char == "X" || char == "O"
      move_count.push(1)
    end
  end
  move_count.length.to_i
end

def current_player(board)
    num = turn_count(board)
    if num % 2 == 0
      return "X"
    else
      return "O"
    end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    pos_1 = board[win_combination[0]]
    pos_2 = board[win_combination[1]]
    pos_3 = board[win_combination[2]]
   if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
     return win_combination
   end
end
return false
end

def full?(board)
  if board.detect {|i| i == " " || i == nil}
    return false
  else
    return true
  end
end

def draw?(board)
  won?(board) == false && if full?(board) == true
    return true
end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if win_combination = won?(board)
  #return first item in the win_combination array
  board[win_combination.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
end
if winner(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cat's Game!"
end
end
