WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ]
  
  def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end  

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end  

def position_taken?(board, index)
  if  (board[index] == "") || (board[index] == " ") || (board[index] == nil)
    return false
  elsif (board[index] != "") || (board[index] != " ") ||(board[index] != nil)
    return true
  end
end 

def input_to_index(input)
  input.to_i - 1 
end

def move(array, input, char)
  array[input] = char
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

def play(board)
  
  until over?(board)
    turn(board)
    
   end 
   if draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1 
    end
  end
  return counter
end

def current_player(board)
    if turn_count(board).odd? 
      return "O"
    elsif turn_count(board).even?
      return "X"
    end
end

 def won?(board)
    WIN_COMBINATIONS.any? do |combo|
          if board[combo[0]] == "X" && 
          board[combo[1]] == "X" && 
          board[combo[2]] == "X" || 
          board[combo[0]] == "O" && 
          board[combo[1]] == "O" && 
          board[combo[2]] == "O"
          return combo
          end
      end
  end 
  
def full?(board)
  board.none? do |index|
     index == " "
  end
end 

def draw?(board)
  full?(board) && !won?(board)
end
  
def over?(board)
  full?(board) || won?(board) || draw?(board) 
end

def winner(board)
    if won?(board)
       winning_line = won?(board)
       return board[winning_line[0]]
    end
end