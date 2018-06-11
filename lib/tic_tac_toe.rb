def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row win_combination[0]
  [3,4,5],  # Middle row win_combination[1]
  [6,7,8],  # Bottom row win_combination[2]
  [0,3,6],  # Left column win_combination[3]
  [1,4,7],  # Middle column win_combination[4]
  [2,5,8],  # Right column win_combination[5]
  [0,4,8],  # 1st diagonal win_combination[6]
  [2,4,6]  # 2nd diagonal win_combination[7]
]

def full?(board)
  if board.include?(" ") == true
    return false
  else
    return true
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
    end
  end
   return false
end

def draw?(board)
  win = won?(board)
  full = full?(board)
  if win==false && full==true
    return true
  end
  return false
end

def over?(board)
  win = won?(board)
  draw = draw?(board)
  if win != false || draw == true
    return true
  end
  return false
end

def winner(board)
  if !won?(board)
   return nil
  else
   winner_index = won?(board)[0]
   winner = board[winner_index]
   winner
  end
end


def input_to_index(user_input)
  user_input.to_i - 1
end


def move(board, index, player_token)
  board[index] = player_token
end


def position_taken?(board, location)
  board[location] == "X" || board[location] == "O"
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  player_token = current_player(board)
  if !valid_move?(board, index)
    puts "invalid"
    puts "Please enter 1-9:"
    user_input = gets.strip
  else
    move(board, index, player_token)
    display_board(board)
  end
end

def play(board)
    until over?(board)
      turn(board)
   end
   if won?(board)
     puts "Congratulations #{winner(board)}!"
   end
   if draw?(board)
     puts "Cat's Game!"
   end
end


def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  counter = turn_count(board)
  if  counter % 2 == 0
    "X"
  else
    "O"
   end
 end
