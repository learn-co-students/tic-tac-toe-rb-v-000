# Define your WIN_COMBINATIONS constant
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

# display_board
def display_board (board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end

#move
def move(board, index, current_player)
  board[index] = current_player
end

#position_taken
def position_taken?(board, position)
  board[position] != " " && board[position] != ""
end

#valid_move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#turn
def turn(board)
 puts "Please enter 1-9:"
 input = gets.strip #"1"
 index = input_to_index(input)
 if valid_move?(board, index)
   move(board, index, current_player(board))
 else
   turn(board)
 end
 display_board(board)
end

#turn_count
def turn_count(board)
turns = 0
board.each do |token|
if token == "X" || token == "O"
turns += 1
 end
 end
  turns
 end

#current_player
 def current_player(board)
 turn_count(board) % 2 == 0 ? "X" : "O"
 end

#won?
 def won?(board)
 WIN_COMBINATIONS.find do |combo|
      board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[0])
    end
  end
#full
  def full?(board)
   board.all?{|token| token == "X" || token == "O"}
  end
#draw
  def draw?(board)
  !won?(board) && full?(board)
  end

#over?
  def over?(board)
  won?(board) || draw?(board)
end

#winner
def winner(board)
  if winning_combo = won?(board)
  board[winning_combo.first]
 end
 end

#playmethod
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
