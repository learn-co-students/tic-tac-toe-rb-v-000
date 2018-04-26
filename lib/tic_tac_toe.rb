def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
   user_input.to_i - 1
end
 
def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  while !over?(board)
        turn(board)
  end
  
  if winner(board) == "X"
     puts "Congratulations X!"
   elsif winner(board) == "O"
     puts "Congratulations O!"
   else
     puts "Cat's Game!"
   end
   
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || 
      position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
    end
  end
  false
end

def full?(board)
 board.include?(" ") ? false : true
end 

def draw?(board)
  won?(board) || !full?(board) ? false : true
end

def over?(board)
  draw?(board) || full?(board) || won?(board) ? true : false
end

def winner(board)
  if(won?(board))
    board[won?(board)[0]]
  else
    nil
  end
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index == "O" || index == "X"
      count += 1
    end
  end 
  return count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end 