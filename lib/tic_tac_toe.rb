# possible combinations that a player can win in ttt
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


# method to display an initial ttt board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


# takes user input and converts to array index
def input_to_index(user_input)
  user_input = user_input.to_i - 1
end


# takes user's input and makes ttt move
def player_move(board, user_input, player)
  board[user_input] = player
end

# checks to see if user's input matches a position that is already taken
def position_taken?(board, index)
  position = board[index]
  if (position == " " || position == "" || position == nil)
    return false
  else
    return true
  end
end


# checks to see if user's input is a valid move
def valid_move?(board, index)
  if (!position_taken?(board, index)) and index.between?(0,8)
    true
  end
end

# takes user's input
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board, index)
      player = current_player(board)
      player_move(board,index,player)
      display_board(board)
  else
    puts "That move isn't valid."
    turn(board)
  end
end


# keeps track of who's turn it is
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end


# keeps track of which to display
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end


# checks all possible win combinations to see if user has won
def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  }
  return false
end


# checks to see if the board is full
def full?(board)
  if board.include?(" ") == true
    return false
  end
  return true
end


# checks to see if there's a draw
def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
  return false
end


# checks to see if the game is done
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end


# checks if there is a player who has won
def winner(board)
  if won?(board)
    winning_player = board[(won?(board)[0])]
    return winning_player
  end
end

# returns winner of game (if any)
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winning_player = winner(board)
    puts "Congratulations #{winning_player}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
