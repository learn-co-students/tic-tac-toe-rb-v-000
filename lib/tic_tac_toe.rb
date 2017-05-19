WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i
  new = user_input.to_i - 1
  return new
end

def move(display_board, input_to_index, char)
  display_board[input_to_index] = char
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  else board[index] == " " || "" || nil
    return false
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else valid_move?(board, index) == false
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
    count = 0
  board.each do |x| if x == "X" || x == "O"
    count += 1
  end
end
  count
end

def current_player(board)
  x = turn_count(board) % 2
  if x == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)

  position_0 = board[0]
  position_1 = board[1]
  position_2 = board[2]
  position_3 = board[3]
  position_4 = board[4]
  position_5 = board[5]
  position_6 = board[6]
  position_7 = board[7]
  position_8 = board[8]

# this looks unnecessary but does the job

    if position_0 == "X" && position_1 == "X" && position_2 == "X" #top row [0,1,2]
      return WIN_COMBINATIONS[0]
    elsif position_0 == "O" && position_1 == "O" && position_2 == "O" #top row [0,1,2]
      return WIN_COMBINATIONS[0]
    elsif position_3 == "X" && position_4 == "X" && position_5 == "X" #middle row [3,4,5]
      return WIN_COMBINATIONS[1]
    elsif position_3 == "0" && position_4 == "0" && position_5 == "0" #middle row [3,4,5]
      return WIN_COMBINATIONS[1]
    elsif position_6 == "X" && position_7 == "X" && position_8 == "X" #bottom row [6,7,8]
      return WIN_COMBINATIONS[2]
    elsif position_6 == "O" && position_7 == "O" && position_8 == "O" #bottom row [6,7,8]
      return WIN_COMBINATIONS[2]
    elsif position_0 == "X" && position_3 == "X" && position_6 == "X" #left column [0,3,6]
      return WIN_COMBINATIONS[3]
    elsif position_0 == "O" && position_3 == "O" && position_6 == "O" #left column [0,3,6]
      return WIN_COMBINATIONS[3]
    elsif position_1 == "X" && position_4 == "X" && position_7 == "X" #middle column  [1,4,7]
      return WIN_COMBINATIONS[4]
    elsif position_1 == "O" && position_4 == "O" && position_7 == "O" #middle column  [1,4,7]
      return WIN_COMBINATIONS[4]
    elsif position_2 == "X" && position_5 == "X" && position_8 == "X" #right column [2,5,8]
      return WIN_COMBINATIONS[5]
    elsif position_2 == "O" && position_5 == "O" && position_8 == "O" #right column [2,5,8]
      return WIN_COMBINATIONS[5]
    elsif position_0 == "X" && position_4 == "X" && position_8 == "X" #left diagonal [0,4,8],
      return WIN_COMBINATIONS[6]
    elsif position_0 == "O" && position_4 == "O" && position_8 == "O" #left diagonal [0,4,8],
      return WIN_COMBINATIONS[6]
    elsif position_2 == "X" && position_4 == "X" && position_6 == "X" #right diagonal [2,4,6]
      return WIN_COMBINATIONS[7]
    elsif position_2 == "O" && position_4 == "O" && position_6 == "O" #right diagonal [2,4,6]
      return WIN_COMBINATIONS[7]
    else
      false
    end
end

def full?(board)
  board.all? {|x| x == "X" || x == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
 won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    win_1 = won?(board)[0]
    puts win_1

    if board[win_1] == "X"
      return "X"
    elsif board[win_1] == "O"
      return "O"
    else
      nil
    end
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
