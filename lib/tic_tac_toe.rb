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
  converted_input = "#{user_input}".to_i - 1
end

def move(board, converted_input, value)
  board[converted_input] = value
end

def position_taken?(board, index)
   if board[index] ==  "X" || board[index] == "O"
    return true
   elsif board[index] == " " ||  board[index] == "" ||  board[index] == nil
    return false
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  elseif index < 0 || index > 8
  return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, value = "X" || "O")
    display_board(board)
  else
    valid_move?(board, index) == false
    turn(board)
  end
end


def turn_count(board)
  counter = 0

  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      puts "#{counter}"
    end
  end

  counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.none? do |position|
    position == " "
  end
end

 def draw?(board)
  full?(board) == true && !won?(board) == true
end

 def over?(board)
  won?(board) || draw?(board)
end

 def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end

def play(board)
  counter = 0
  until over?(board) || counter == 9
    turn(board)
    counter += 1
  end
end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    print "Cat's Game!"
  end
end
