WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,4,8], #left to right diagonal win
  [2,4,6], #right to left diagonal win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8]  #right column win
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

def player_move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player_move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns_played = 0
  board.each do |element|
    if element == "X" || element == "O"
      turns_played += 1
    end
  end
  turns_played
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  full_board = board.all? do |element|
    element == "X" || element == "O"
  end
  full_board
end

def draw?(board)
  full?(board) && ! won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board) == false
    nil
  else
    won_list = won?(board)
    position = won_list[0]
    return board[position]
  end
end

def play(board)
  counter = 0

  while counter < 10 && over?(board) == false
    counter += 1
    turn(board)
  end

  the_winner = winner(board)

  if draw?(board) == true
    puts "Cat's Game!"
  else
    puts "Congratulations #{the_winner}!"
  end

end
