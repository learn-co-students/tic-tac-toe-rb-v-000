# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#
# # Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input = undefined)
  return input.to_i - 1
end

# makes the move
def move(board, index, token) #move(board, index, token = "X")
  board[index] = token
  return board
end

# #------------------------------------------------------
# #
# # # Helper Method
# # def position_taken?(board, index)
# #   !(board[index].nil? || board[index] == " ")
# # end
# #------------------------------------------------------


def position_taken?(board,idx)
  if board[idx] == " " || board[idx] == "" || board[idx] == nil
     return false
   else
     return true
  end
end

def valid_move?(board, idx)
  if (position_taken?(board, idx) == false) && (idx.between?(0, 8) == true)
    return true
else
    return false
  end

end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)

  if valid_move?(board,index) == true
    move(board,index,token)
    display_board(board)
  else
    turn(board)
  end

end


def turn_count(board)
	count = 0
	board.each do |position|
		if position == "X" || position == "O"
			count += 1
		end
	end
return count
end


def current_player(board)
	if turn_count(board) % 2 == 0
		return "X"
	else
		return "O"
	end
end


def won?(board)


  WIN_COMBINATIONS.each do |win_combo|
      position1 = board[win_combo[0]]
      position2 = board[win_combo[1]]
      position3 = board[win_combo[2]]
      comparison_set = [position1, position2, position3]

      if comparison_set == ["X","X","X"] || comparison_set == ["O","O","O"]
          return win_combo
      else
        next
      end
    end
  false
end


def full?(board)
board.all?{|ch| ch == "X" || ch == "O" }
end


def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    false
  end
end


def over?(board)
  if won?(board) || full?(board)
    return true
  end
false
end


def winner(board)
  if over?(board) == true
    winning_combo = won?(board)
    return board[winning_combo[0]]
  end

end


def play(board)
  until over?(board) || draw?(board)
  turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif
    puts "Cat's Game!"
  end
end
