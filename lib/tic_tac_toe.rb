require 'pry'
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
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

def move(board, position, char)
  board[position] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def position_exzist(index)
   index.between?(0, 8)
end

def valid_move?(board, index)
  position_exzist(index) && !position_taken?(board, index)
end

def turn(board)
	puts "Please enter 1-9:"
	user_input = gets.chomp.strip
	index = input_to_index(user_input)
	if !valid_move?(board,index)
		puts "Invalid Entry. Please enter 1-9:"
		user_input = gets.chomp.strip
	else
    user_mark = current_player(board)
    board[index] = user_mark
	end
	display_board(board)
end

def turn_count(board)
  board.select {|space| !space.strip.empty? && space != nil}.length
end

def current_player(board)
	turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_1 = combo[0]
    win_2 = combo[1]
    win_3 = combo[2]

    if board[win_1] == "X" && board[win_2] == "X" && board[win_3] == "X"
      return combo
    elsif board[win_1] == "O" && board[win_2] == "O" && board[win_3] == "O"
      return combo
    end
  end
  false
end

def full?(board)
  !board.any? {|space| space == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    combo = won?(board)
    win_1 = combo[0]
    board[win_1]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
