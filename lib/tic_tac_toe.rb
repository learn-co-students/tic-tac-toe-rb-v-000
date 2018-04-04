#Helper methods

WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #center column win
  [2,5,8], #right column win
  [0,4,8], #left diagonal win
  [2,4,6] #right diagonal win
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

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  end #close if block
end #close method definition

def turn_count(board)
  counter = 0
  board.each do |index|
    if index != " "
      counter += 1
    end #close if block
  end #close iteration block
  return counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && position_taken?(board, combination[0])
  end #close block
end #close method definition

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end #close block
end #close method definiton

#And now, the critical method!

def play(board)
  until over?(board)
    turn(board)
  end #close block

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end #close conditional block 
end
