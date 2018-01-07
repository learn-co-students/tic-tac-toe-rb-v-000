WIN_COMBINATIONS = [
  [0,1,2], #top_row_win
  [3,4,5], #middle_row_win
  [6,7,8], #bottom_row_win
  [0,3,6], #left_column_win
  [1,4,7], #center_column_win
  [2,5,8], #right_column_win
  [0,4,8], #left_diagonal_win
  [2,4,6] #right_diagonal_win
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
    board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
       index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)

   if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
   else
    puts "Sorry, invalid move. Please enter 1-9: "
    turn(board)
   end
end

def turn_count(board)
   board.count do |position|
     position != " "
   end
 end

def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
   if win_combination = won?(board)
         board[win_combination.first]
   end
 end

#def winner?(board)
#  won?(board) && board[won?(board)[0]]
#  display_board(board)

#end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
