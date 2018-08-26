# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Middle column
  [2,5,8],  # Last column
  [0,4,8],  # diagnoal one 
  [2,4,6]  # last diagnal 
]

def won?(board) 
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3] 
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination 
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination 
   	  end # end if
    end # end each
  false
end # end won?

def full?(board) 
  if board.include?(" ")
    false
  else 
    true 
  end 
end #ends full 

def draw?(board)
  if full?(board) && !won?(board)
    true 
  end 
end #ends draw?

def over?(board)
  if won?(board)
    true 
  elsif draw?(board)
    true
  end #ends if
end #ends over 

def winner(board)
  if won?(board) 
    true
    WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
    
     position_1 = board[win_index_1]
     position_2 = board[win_index_2] 
     position_3 = board[win_index_3]
     
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X" 
      elsif position_1 == "O"  && position_2 == "O" && position_3 == "O"
      return "O" 
      end #end if 
    end #end each/do block
  end #end if statement 
end #end win_combinations

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
 converted_input = user_input.to_i - 1
end


def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index) == true
      move(board, index, character='X')
      display_board(board)
    else turn(board)
  end
end
  

def turn_count(board)
  counter = 0
  board.each do |turns|
    if turns == "X" || turns == "O"
      counter += 1 
    end
  end
  counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else 
    "O"
  end
end 

def play(board)
  until over?(board)
    turn(board)
  end #ends until loop 
  if won?(board)
    puts "Congratulations! You won."
  elsif draw?(board)
    puts "Cat's Game!"
  end #ends if statement 
end #ends play 
  
