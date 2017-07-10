
WIN_COMBINATIONS = [
[0,1,2], # Top Row
[3,4,5], # Middle Row
[6,7,8], # Bottom Row
[0,3,6], # Left Column
[1,4,7], # Middle Column
[2,5,8], # Right Column
[2,4,6], # Diagonal Right Corner
[0,4,8] # Diagonal Left Corner
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

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  if index.between?(0,8) == true && position_taken?(board, index) == false
  return true
else
  return false
    end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player_token = current_player(board) #set local variable to return value of current_player method
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
counter = turn_count(board)
  if counter % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
# check board and return the winning combination indexes as an array
# if there is a win and false/nil if no win combination

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" &&
      position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
    return false
end

def full?(board)
  board.all? do |board_index|
    board_index == "X" || board_index == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true ||
    full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board)
    winner = won?(board) # get return value of # #won method (win_combination)
    return board[winner[0]]
  else
    return nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
      if won?(board)
        win_token =  winner(board)# get return value of #winner method
        puts "Congratulations #{win_token}!"
      elsif draw?(board)
        puts "Cats Game!"
      end
  end
