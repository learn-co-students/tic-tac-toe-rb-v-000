board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

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

def input_to_index(user_input)
  user_input.to_i - 1
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def move(board, input_to_index, current_player)
 board[input_to_index] = current_player
end

def valid_move?(board, index_number)
  if board [index_number] == " " && index_number.between?(0 , 8)
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else puts "Move is invalid"
    turn(board)
  end
end

def turn_count(board)
count = 0
board.each do |player|
  if player == " "
    count += 0
  else count += 1
  end
end
turn_count = count
end

def current_player(board)
  turn_count(board).even? == true ? current_player = "X" : current_player = "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" &&
       board[combo[2]] == "X"
    return combo
  elsif board[combo[0]] == "O" && board[combo[1]] == "O" &&
        board[combo[2]] == "O"
    return combo
  else
    end
  end
  return false
end

def full?(board)
 board.none?{|position| position == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else  full?(board) == false
    return false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  elsif full?(board) == false
    return false
  else
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" &&
       board[combo[2]] == "X"
    return "X"
  elsif board[combo[0]] == "O" && board[combo[1]] == "O" &&
        board[combo[2]] == "O"
    return "O"
  else
  end
 end
 return nil
end

def play(board)

until over?(board) == true
  turn_count(board)
  current_player(board)
  turn(board)
  end
  if won?(board) != false && winner(board) == "X"
    puts "Congratulations X!"
  elsif won?(board) != false && winner(board) == "O"
    puts "Congratulations O!"
  else draw?(board) == true
    puts "Cats Game!"
  end
end
