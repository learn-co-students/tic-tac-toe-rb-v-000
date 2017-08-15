require 'pry'

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

def move(array, index, player)
 array[index] = player
end

def position_taken?(board,index)
	board[index] != " " && board[index] != "" && board[index] != nil
end

def valid_move?(board, index)
index >= 0 && index <= 8 && !position_taken?(board, index)
end

def turn(board)
	puts "Please enter 1-9:"
 	user_input = gets.strip
 	index = input_to_index(user_input)
	if valid_move?(board,index)
		move(board, index, current_player(board))
		display_board(board)
	else
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
	counter
end

def current_player(board)
	if turn_count(board) % 2 == 0
		return "X"
	else
		return "O"
	end
end

def won?(board)
  winning_combo = false
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo[0]) && position_taken?(board, combo[1]) && position_taken?(board, combo[2])
      if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
        winning_combo = combo
      end
    end
  end
  winning_combo
end

def full?(board)
    board_full = true
    board.each do |value|
      if value == " "
        board_full = false
      end
    end
  board_full
end

def draw?(board)
  game_draw = false
    if won?(board) == false && full?(board) == true
      game_draw = true
    end
  game_draw
end

def over?(board)
  game_over = false
    if won?(board) == true || full?(board) == true || draw?(board) == true
      game_over = true
    end
  game_over
end

def winner(board)
  winner = "X"
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      winner = board[combo[0]]
    end
      if won?(board) == false
        winner = nil
      end
    end
  winner
end


def play(board)
  until over?(board) || won?(board) || draw?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
