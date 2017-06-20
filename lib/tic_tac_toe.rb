WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left columns
  [1, 4, 7], #middle columns
  [2, 5, 8], #right columns
  [0, 4, 8], #diagonal 1
  [2, 4, 6] #diagonal 2
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end# out the current state.

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  elsif board[index] == " " || ""
    return false
  end
end

def valid_move?(board, index)
  if index.to_i >= 0 && index.to_i <8  && position_taken?(board, index) == false
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
  if space == "X"
      counter += 1
    elsif space == "O"
        counter += 1
    end
  end
return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |space|
    space == "X" ||
    space == "O"
  end
end

def draw?(board)
  if  !won?(board) && full?(board)
      return true
  else return false
  end
end

def over?(board)
  if won?(board) ||
    draw?(board) ||
    full?(board)
    return true
  else return false
  end
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  else
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
