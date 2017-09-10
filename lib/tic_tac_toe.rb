# Define your WIN_COMBINATIONS constant
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

# Define display_board that accepts a board and prints
# out the current state.
board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board,index,current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || "O"
    true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !(position_taken?(board, index))
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if index.between?(0,8)
    valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |element|
    if element != " "
    turns += 1
    end
  end
  #puts "Number of turns = #{turns}"
  return turns
end

def current_player(board)
  turns = turn_count(board)
            turns % 2 == 0 ? current_player = "X" : current_player = "O"  #Ternary if
            #if turns.even?   #% 2 == 0
            #  current_player = "X"
            #else
            #  current_player = "O"
            #end
  #puts "The current player is #{current_player}"
  return current_player
end

def won?(board)
  if board == [" "," "," "," "," "," "," "," "," "]
    return false
  end
  WIN_COMBINATIONS.detect {|array|
    board[array[0]] == board[array[1]] &&
    board[array[1]] == board[array[2]] &&
    position_taken?(board, array[0])}
end

def full?(board)
  if board.detect {|i| i == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]] == "X"
      return "X"
    elsif board[won?(board)[0]] == "O"
      return "O"
    else
      return nil
    end
  else
    return nil
  end
end

def play(board)
  counter = 0
  while counter.between?(0,8) && !(over?(board))
    turn(board)
    counter += 1
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end
end
