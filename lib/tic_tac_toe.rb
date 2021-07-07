require 'pry'
WIN_COMBINATIONS = [[0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [2,4,6]
                   ]
                   
def display_board(current)
  puts " #{current[0]} | #{current[1]} | #{current[2]} " 
  puts "-----------"
  puts " #{current[3]} | #{current[4]} | #{current[5]} "
  puts "-----------"
  puts " #{current[6]} | #{current[7]} | #{current[8]} "
  end                   
  
def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
     return false
  else 
     return true
    end
  end
  
def valid_move? (board, index)
  if index.between?(0, 8)
      if board[index] == " " || board[index] == "" || board[index] == nil
        return true
      else 
        return false
      end
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  user_input = input_to_index(input)
  if valid_move?(board, user_input) == false
    turn(board)
  else move(board, user_input, character = current_player(board))
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
  end
  return counter
  end
  
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
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
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
  end
  false
end

def full?(board)
  board.all? {|space| space != " "}
end

def draw?(board)
  if full?(board) == true
    if won?(board) == false
      true
    else
      false
    end
  else 
    false
  end
end
  
def over?(board)
 won?(board) || draw?(board)
end

def winner(board)
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
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
  end
  nil
end

def play(board)
 
  until over?(board)
    turn(board)
  end
    
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end

