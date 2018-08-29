
WIN_COMBINATIONS =  [
   [0,1,2], [3,4,5],[6,7,8],
   [0,3,6], [1,4,7], [2,5,8],
   [0,4,8], [2,4,6]
   ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, input) 
  board[index] = input
end

def turn(board)
 puts "Please enter 1-9:"
 input = gets.strip
 token = current_player(board)
 index = input_to_index(input) 
  if valid_move?(board, index)
    move(board, index, token) 
    display_board(board)
  else 
    turn(board)
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board,index)
end
  
#   board(input_to_index[user_input])
#     if [index] > 0 && [index] < 10
#       puts "Valid entry."
#     else
#       puts "Invalid entry."
#     end
# end

def position_taken?(board, index)
   board[index] == "X" || board[index] == "O"
end

# def input_to_index(number)
#   number.to_i - 1
# end

def turn_count(board)
  count = 0 
  board.each do |cell|
    if cell == "X" || cell == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0 #eval
    return "X" #positive
  else
    return "O" #negative
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)  || full?(board)
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
   
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
   
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    end
  end
  
  false
end
    
def full?(board)
   board.all? {|b| b != " " }
end

def winner(board)
  winning_array = won?(board) #Setting winning_array to equal results from won?(board)
  if won?(board) # Implicit return of boolean -> if true return which character won
    return board[winning_array[0]] 
  else
    return nil
  end
end 


