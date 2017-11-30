WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]



def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "

end
def valid_move?(board, index)
if !(position_taken?(board, index)) && index.between?(0, 8)
  return true
else
return false || nil

end
end
# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.

def input_to_index(user_input)
  user_input.to_i - 1
end
def move(board, input_to_index, character )
  board[input_to_index] = character
return board
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
if valid_move?(board, index)
  move(board, index, current_player(board))
 display_board(board)
else
  puts "Sorry, that was incorrect, please enter 1-9:"
turn(board)
end
end

def turn_count(board)
counter = 0
board.each do |turn|
  if turn == "X" || turn == "O"
counter += 1
end
end
return counter
end

def current_player(board)

turn_count(board) % 2 == 0 ? "X" : "O"

end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
   WIN_COMBINATIONS.each_with_index do |win_combination, index|
    if position_taken?(board, win_combination[0]) == true
      if board[win_combination[0]] == board[win_combination[1]] &&
       board[win_combination[1]] == board[win_combination[2]]
       return WIN_COMBINATIONS[index]
          end
          end
          end
      return false
     end

def full?(board)
board.none? do | index |
  index == " " || index == " "
end
end

def draw?(board)
won?(board) == false && full?(board) == true
end


def over?(board)
draw?(board) == true || won?(board) != false
end


def winner(board)
if won?(board) != false
  winner = board[won?(board)[0]]
end
end

def play(board)
  while over?(board) == false
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    draw?(board) == true
      puts "Cat's Game!"
end
end
