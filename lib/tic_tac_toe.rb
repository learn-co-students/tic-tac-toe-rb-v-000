def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#PLAY
def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board) != false
    winning_token = winner(board)
    puts "Congratulations #{winning_token}!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end
end

#TURN
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end

#Helper methods for TURN
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def move(board, index, player)
  board[index] = player
end

#need to integrate below into play

def current_player(board)
  board_count = turn_count(board)
  if board_count % 2 == 0
      player = "X"
  else
      player = "O"
  end
end

#Helper method for CURRENT PLAYER
def turn_count(board)
  counter = 0
  board.each {|turn|
    if turn == "X"
      counter +=1
    elsif turn == "O"
      counter +=1
    end
    }
  board = counter
end

#WIN, DRAW, and OVER
def winner(board)
  winning_array = won?(board)
  if winning_array != false
      winning_token = winning_array[0]
      token = board[winning_token]
  end
end

def draw?(board)
  won = won?(board)
  full = full?(board)
  if won == false && full == true
    return true
  end
    false
end

def over?(board)
  draw = draw?(board)
  won = won?(board)
  if draw == true
    return true
  elsif won != false
    return true
  end
  false
end

#Helper methods for WIN/DRAW/OVER
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return [win_index_1, win_index_2, win_index_3]
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return [win_index_1, win_index_2, win_index_3]
    end
  end
  false
end

def full?(board)
  board.all? do |position|
    position != " "
  end
end
