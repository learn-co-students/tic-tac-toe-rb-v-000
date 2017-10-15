def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

display_board(board)
display_board(board)
display_board(board)

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  # win_combination is a 3 element ar
  WIN_COMBINATIONS.each do |win_combination|# grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3]
    # load the value of the board at
    win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
    end
  end
  false
end
# board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
def full?(board)
  board.all? {|token| token == "X" || token == "O"}

end
 #  top_row_win = [0,1,2]
def draw?(board)
  if full?(board) == true && won?(board) == false
  return true
  else
  return false
  end
end #  if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board

 def over?(board)
   won?(board) || full?(board)
 end

 def winner(board)
   if win_combination = won?(board)
   board[win_combination[0]]
 end
 end

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

 def input_to_index(input)
  index = input.to_i - 1
 end

 def move(board, index, token = "X")
   # array is our array of tokens "X", "O", " "
   # we need to update our array at the point of the index to that character(token)

   board[index] = token
 end
