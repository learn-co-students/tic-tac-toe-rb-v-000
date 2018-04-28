# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal 1 
  [6,4,2]  #Diagonal 2
  
]

# display_board
def display_board(board)
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "  
end

# input_to_index
def input_to_index(index)
  converted_index = index.to_i
  converted_index -= 1
end

# move
def move(board, converted_index, char)
    board[converted_index] = char
end

# code your #position_taken? method here!
def position_taken?(board, index)
    if (board[index] == " " || board[index] == "" || board[index] == NIL)
      return FALSE
    elsif board[index] == "X" || "O"
      return TRUE
    end
end    
    
def valid_move?(board, index)
  if (index.between?(0,8) && position_taken?(board, index) == FALSE)
      return TRUE
  else
      return FALSE
  end
end    
 
#turn
    def turn(board)
      puts "Please enter 1-9:"
      input = gets.strip
      converted_index = input_to_index(input)
      if valid_move?(board, converted_index) == TRUE
        move(board, converted_index, current_player(board))
        display_board(board)
    else
      turn(board)
    end
end

# Current Player
def turn_count(board)
  counter = 0 
  board.each do |array|
    if array == "O" || array == "X"
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
    return player
  end

# won?
def won?(board)
WIN_COMBINATIONS.each do |win_combination| 
  
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
 
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
 
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination # return the win_combination indexes that won.
    else
      false
    end
  end
  false
end

# full
def full?(board)
  board.all? {|combination| combination == "X" || combination == "O"}
end

# draw
def draw?(board)
  if full?(board) == TRUE && won?(board) == FALSE
    return TRUE
  else
    return FALSE
  end
end

# over
def over?(board)
  if draw?(board) == TRUE || full?(board) == TRUE || won?(board) == TRUE || (won?(board) && full?(board) == FALSE)
    return TRUE
  else
    return false
  end
end

# winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

def play(board)
  while over?(board) == false do
    turn(board)
  end

if winner(board) == "X"
  puts "Congratulations X!"
elsif winner(board) == "O"
  puts "Congratulations O!"
elsif draw?(board) == TRUE
puts "Cat's Game!"
  end
end