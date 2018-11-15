def input_to_index(user_input)
  x = user_input.to_i
  move = x - 1
end

WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # left diagonal
  [2, 4, 6], # right diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, index)
  !( board[index] == "" || board[index] == " " || board[index] == nil)
end

def valid_move?(board, index)
  if index.between?(0,8)
       if board[index] == "" || board[index] == " " || board[index] == nil
       true
    else
      false
    end
  else
   return nil
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip

  index = input_to_index(user_input)

  if valid_move?(board, index) == true
    player_token = current_player(board)
    move(board, index, player_token)
  else
      turn(board)
  end
  display_board(board)
end

def turn_count(board)
 counter = 0
  board.each do |position|
    if ((position == "X") || (position == "O"))
      counter += 1
     end
  end
  return counter
end

def current_player(board)

  even_odd = turn_count(board)

  if (turn_count(board) == 0) || (true == even_odd.even?)
    "X"
  else
    "O"

  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && (board[combo[0]] == "X" || board[combo[0]] == "O")
  end
end

def full?(board)
  !board.any? do |position|
    position == " "
  end
end

def draw?(board)

  if  !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)

  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  x = nil
  if WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && (board[combo[0]] == "X") end
    x = "X"
  elsif WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && (board[combo[0]] == "O") end
    x = "O"

  end

  return x
end

def play(board)
  until over?(board)
    turn(board)
  end #until over?

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end #if
end #play
