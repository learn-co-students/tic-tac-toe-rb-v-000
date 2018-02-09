# code for board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

# code your input_to_index
def input_to_index(user_input)
    index = user_input.to_i - 1
 end

 # move method
def move(board, index, char)
  board[index] = char
end

#position_taken
def position_taken?(board,index)
    if board[index] == " "
    return false
    else
    return true
    end
end

#valid_move
def valid_move?(board,index)
  if index.between?(0,8) && position_taken?(board,index) == false
   return true
    else
    return false
 end
end

# turn
  def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  char = current_player(board)
   if valid_move?(board, index)
    move(board, index, char)
    display_board(board)
    else
    turn(board)
    end
end

# turn count
def turn_count(board)
  count = board.select { |board| board == "X"  }.size + board.select { |board| board == "O"  }.size
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

# Won?
def won?(board)
 WIN_COMBINATIONS.each do |combo|
  if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " " && board[combo[0]] != ""
  return combo
   end
  end
  false
end

# Full
def full?(board)
board.all? do |spots|
  spots == "X" || spots == "O"
 end
   end

# Draw
def draw?(board)
   won?(board) == false && full?(board) == true
end

# Over
def over?(board)
    #if draw?(board) == true
     #true
      #end
      if full?(board) == true || won?(board) != false
        true
      end
 end
 def current_player(board)
  if turn_count(board) % 2 == 0
  return "X"
  else
   return "O"
  end
end

 # Winner
def winner(board)
  combo = won?(board)
  if won?(board) != false && board[combo[0]] == "X"
   return "X"
  end
  if won?(board) != false &&  board[combo[0]] == "O"
   return "O"
  else
    return nil
  end
end

# Define your play method below
def play(board)
  current_player(board)
  until over?(board)
  turn(board)
  end
        if won?(board)
        winner(board)
        puts "Congrats #{{winner(board)}}"
      else
          draw?(board)
        puts "It's a cat's game!"
          end
  end
end
