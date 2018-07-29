#WIN_COMBINATIONS
WIN_COMBINATIONS = [
  [0, 1, 2], #top
  [3, 4, 5], #middle
  [6, 7, 8], #bottom
  [0, 3, 6], #|
  [1, 4, 7], # |
  [2, 5, 8], #  |
  [0, 4, 8], #\
  [2, 4, 6] #/
]

#display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index
def input_to_index(user_input)
  index = user_input.to_i - 1
end

#move
def move(board, index, player)
  board[index] = "#{player}"
end

#position_taken
def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

#valid_move?
def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
end

#turn
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

#turn_count
def turn_count(board)
  turn = 0
  board.each do |index|
      if (index == "X" || index == "O")
      turn += 1
    end
  end #Have to terminate the loop before you can get the final** return value of "turn"!!
    return turn
end

#current_player
def current_player(board)
    turn = turn_count(board)
    if turn % 2 == 0
      return "X"
    else
      return "O"
    end
  end

#won?
def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[2]] != " "
  end
end

#full?
def full?(board)
  board.none? { |index| index == " " } && !won?(board)
end

#draw?
def draw?(board)
  full?(board)
end

#over?
def over?(board)
  won?(board) || full?(board) || draw?(board)
end

#winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

#PLAY!
def play(board)
  while over?(board) == false
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
