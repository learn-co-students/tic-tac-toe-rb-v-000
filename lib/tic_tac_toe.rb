#define WIN_COMBINATIONS
WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]


def display_board(board)#{} Define a method display_board that prints a 3x3 Tic Tac Toe Board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
#input_to_index
def input_to_index(user_input)
  integer = user_input.to_i
  index = integer - 1
end
#move
def move(board, input_to_index, value)
  puts board
  update_array_at_with(board, input_to_index, value)
end

def update_array_at_with(board, index, value)
  board[index] = value
  return board
end
#position_taken
def position_taken?(board, index)
  (board[index] == " " || "")? false:true
  (board[index] == "X" || board[index] =="O")
end
#valid_move
def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    return true
  else position_taken?(board, index) == true
      return false
  end
end
#turn
def turn(board)
  puts "Please enter 1-9:"
user_input = gets.strip
index = input_to_index(user_input)
# input_to_index(user_input)
  if valid_move?(board, index) == true
    # display_board(board)
    update_array_at_with(board, index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end
#turn_count
def turn_count(board)
  turn_count_number = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      turn_count_number += 1
    end
  end
  return turn_count_number
end

#current_player
def current_player(board)
  if turn_count(board).even?
    return "X"
  else turn_count(board).odd?
    return "O"
  end
end
#won?
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|

    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
    position_1 ==  position_2 && position_2 == position_3  && position_1 != " "
  end
end
#full?
def full?(board)
  board.all? do |position|
    position =="X"||position=="O"
  end
end
#draw?
def draw?(board)# returns false if there are any winning combinations
  if full?(board) && !won?(board)
      return true
  else
    return false
  end
end
#over?
def over?(board)
  if draw?(board)|| won?(board)|| full?(board)
    return true
  end
end
#winner?
def winner(board)
  win = won?(board)
win ? board[win[0]] : nil
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
