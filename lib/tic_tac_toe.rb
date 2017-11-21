WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #Left diag
  [2,4,6], #right diag
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8] #right column
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(player_input)
  player_input.to_i - 1 #converts the number from string to integer and subtracts 1 for array input_to_index
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O" #
end

def move(board, index, current_player)
  board[index] = current_player #takes the board, the index the player wants to use, and the current player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def valid_move?(board, index)
  if index.between?(0,8)
    if !position_taken?(board, index)
      true
    end
  end
end

def turn(board)
  puts ("Please enter 1-9:")
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts ("Please enter a valid move.")
    turn(board)
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

    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all?{|player| player == "X" || player == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if (won?(board))
    win_index = won?(board)[0]
    return board[win_index]
  end
end

def play(board)
  until (over?(board))
    turn(board)
  end
  if (won?(board))
    puts ("Congratulations #{winner(board)}!")
  elsif (draw?(board))
    puts ("Cat's Game!")
  end
end
