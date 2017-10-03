def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, index, token)
  board[index] = token
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
  if !valid_move?(board, index)

    turn(board)
  else
    move(board, index, current_player(board))
  end
  display_board(board)
end

# Define your play method below
def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end


def turn_count(board)
	  turns = 0
	  board.each do |space_on_board|
	    if space_on_board == "X" || space_on_board == "O" || space_on_board == "x" || space_on_board == "o"
	      turns += 1
	    end
	  end
	  turns
	end


	def current_player(board)
	  turns = turn_count(board)
	  if turns % 2 == 0
	    "X"
	  else
	    "O"
	  end
	end
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
WIN_COMBINATIONS.detect do |position|
  if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
    position
  elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
    position
  else
    false
  end
end
end

def full?(board)
  board.all? do |cell|
  cell == "X" || cell == "O"
end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else won?(board)
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
 if solution = won?(board)
  board[solution.first]
 else
  nil
 end
end
