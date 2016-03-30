WIN_COMBINATIONS = [
  [0,1,2], #top win
  [3,4,5], #middle win
  [6,7,8], #bottom win
  [0,3,6], #left colum win
  [1,4,7], #middle colum win
  [2,5,8], #right column win
  [0,4,8], #left to right diagonal win
  [2,4,6] #right to left diagonal win
]

board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, value =current_player(board))
  board[position.to_i-1] = value
end

def position_taken?(board, position)
  board == " " || board == ""
  board[position] == "X" || board[position] == "O"
end

def valid_move?(board,position)
  position = position.to_i-1
  !position_taken?(board,position) && position.between?(0,8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  answer = true
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
     
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3]  
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return answer = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return answer = win_combination
    else
      answer = false
    end
  end
  answer
end
def full?(board)
   if board.any? {|space| space.include?(" ")}
     false
   else
     true
   end
 end
 
 def draw?(board)
   if full?(board)
     if won?(board)
       false
     else 
       true
     end
   else
     false
   end
 end
 
 def over?(board)
   if draw?(board) || won?(board)
     true
   else
     false
   end
 end
 
 def winner(board)
   if token = won?(board)
    board[token.first]
  end
end

def play(board)
  i=0
  until i == 9
    turn(board)
    i +=1
  end
end

def play(board)
  until over?(board)
  turn(board)
end
 if won?(board)
  puts "Congratulations #{winner(board)}!"
 elsif draw?(board)
  puts "Cats Game!"
 end
end

