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
 

 def move(board, location, current_player = "X")
   board[location.to_i-1] = current_player
 end


def position_taken?(board, location)
   !(board[location].nil? || board[location] == " ")
  end


def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
 end


def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   if valid_move?(board, input)
     move(board, input, current_player(board))
   else
     turn(board)
   end
   display_board(board)
  end

def turn_count(board)
   counter = 0
   board.each do |board|
     if board == "X" || board == "O"
       counter += 1
     end
   end
 counter
 end 


def current_player(board)
   if turn_count(board).even? 
    "X"
   else
    "O"
   end
 end


def won?(board) 
  WIN_COMBINATIONS.any? do |win_combination|
    if (board[win_combination[0]] == "X" || board[win_combination[0]] == "O") && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
      win_combination
    end
  end
end


 def full?(board)
   if board.any? {|spot| spot == " " || spot == nil} 
     return false
   else
    true
   end
 end


def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else 
    return false
  end
end
 

def over?(board)
  if won?(board) == true || draw?(board) == true
    true
  else
    false
  end
end


def winner(board)
  WIN_COMBINATIONS.detect do |winner|
  if board[winner[0]] == "X" && board[winner[1]] == "X" && board[winner[2]] == "X"
    return "X"
  elsif board[winner[0]] == "O" && board[winner[1]] == "O" && board[winner[2]] == "O"
    return "O"
  end
end
end
  

def play(board)
  until over?(board) 
    turn(board)
  end
  if won?(board) == true
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
  


      


