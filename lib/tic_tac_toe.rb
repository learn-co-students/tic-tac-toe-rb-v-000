
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

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
 
 def move(board, index, current_player)
   board[index] = current_player
 end
 
 def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
 end

 def valid_move?(board, index)
   index.between?(0,8) && !(position_taken?(board, index))
 end
 
 def turn_count(board)
   turns = 0 
   board.each do |token|
     if token == "X" || token == "O" 
       turns+=1 
     end
    end
 turns
 end
 
 def current_player(board)
   turn_count(board) % 2 == 0? "X" : "O"
 end
 
 def turn(board) 
   puts"Please enter a number 1-9:"
   input=gets.strip
   index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
    else
      turn(board)
    end
    display_board(board)
  end
  
  def won?(board)
     WIN_COMBINATIONS.detect do |win|

     board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] && position_taken?(board, win[0])
     end
   end
   
   def full?(board)
     board.all?{|token| token == "X" || token  == "O"}
   end
  
  def draw?(board)
    full?(board) && !won?(board)
  end
  
  def over?(board)
    won?(board) || draw?(board)
  end
  
  def winner(board)
    if win_combo = won?(board)
      board[win_combo.first]
    end
  end
    
     def play(board)
      while over?(board) == false
       turn(board)
      end
      if won?(board)
        puts"Congratulations #{winner(board)}!"
      else
        puts"Cat's Game!"
      end
    end
    
     
      
      
      
      
  
    
      

 
 
 
    
  
