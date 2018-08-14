WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,4,6],
  [2,5,8],
  ]
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  
 end 
 
def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

 def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " " || "" || nil
    false
  end
end  

 def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

 def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  
 if valid_move?(board,index) 
   move(board, index, current_player(board))
   display_board(board)
 else
   turn(board)
  end
end 
 
 def turn_count(board)
  turn = 0
  board.each do |token|
    if token == "X" || token == "O"
    turn += 1
  end
  end
  turn
end
 def current_player(board)
  if turn_count(board).even? 
    "X"
  elsif turn_count(board).odd?
    "O"
  end
 end 
 
  def won?(board)
    
    WIN_COMBINATIONS.detect do |combos|
      board[combos[0]] == board[combos[1]] && board[combos[2]] == board[combos[1]] && position_taken?(board, combos[0])
    end
  end
  
  def full?(board)
    board.all? {|token| token == "X" || token == "O"}
  end
  
  def draw?(board)
    full?(board) && !won?(board)
  end
  
  def over?(board)
    draw?(board) || won?(board)
  end
  
  def winner(board)
    winner = won?(board)
    
    if winner 
      index = winner[0]
      board[index]
      
    else
      nil
    end
  end 

def play(board)
  until over?(board)
    turn(board)
  end
 
  if won?(board)
    puts "Congratulations #{winner(board) + "!"}"
  else draw?(board)
  puts "Cat's Game!"
end
end