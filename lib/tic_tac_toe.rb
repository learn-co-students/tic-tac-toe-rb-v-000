#FINAL Project

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board) #if board is won. Can also be written by check for true value in winner(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
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

#Display Board. Taken array as arg
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Convert input to index (ie. 0, 1)
def input_to_index(user_input)
  user_input.to_i - 1
end

#assigns a token to a position in the board
def move(board, index, current_player)
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
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  turn = 0

  board.each do |board|
    if board == "X" || board == "O"
      turn +=1
    end
  end
  turn
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
  #if turn_count(board) % 2 == 0
  #  "X"
  #else
  #  "O"
  #end
end

def full?(board)
  if board.include?(" ") == false #returns FALSE if the board is FULL.
    true
  end
end

def draw?(board)
  full?(board) == true && won?(board) == false ? true : false
end

def over?(board)
  if full?(board) == true || draw?(board) == true || won?(board) != false
    true
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

      #if position found in win combo, return position.
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        winning_position = [win_index_1, win_index_2, win_index_3]
        return winning_position #returns the winning combo and exits the method using RETURN
      end
    end #end of DO

  false #FALSE if the game was not won, ie, game not started, game incompelete or game draw

end #end of DEF

def winner(board)
  if won?(board) !=false
    winning_index = won?(board)

    if board[winning_index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end

end
