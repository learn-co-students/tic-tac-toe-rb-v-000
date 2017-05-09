WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row

  [0,3,6], #left horizontal column
  [1,4,7], #Middle horizontal column
  [2,5,8], #Right horizontal column

  [0,4,8], #left to bottom right diagonal
  [2,4,6] #right to bottom left diagonal

]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(userInput)
  input = userInput.to_i - 1

end

def move(board,index,character)
  board[index] = character

end

def position_taken?(board,index)
  if board[index] === " " || board[index] === "" || board[index] === nil
     false
  else
     true
   end
end

def valid_move?(board,index)
  if position_taken?(board,index)
    false
  elsif index.between?(0,8)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  valid_move = valid_move?(board,index)
  if valid_move
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0

  board.each do |move|
    if(move === "X" || move === "O")
      counter += 1
    end
  end
 counter
end

def current_player(board)
  turn = turn_count(board)
  if turn % 2 === 0
    "X"
  else
    "O"
  end
end

def won?(board)

   WIN_COMBINATIONS.detect do |array|
    if board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X"
       return array

  elsif board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O"
       return array
     else
       false
     end
   end
 end


 def full?(board)
   board.all? do |index|
     index != " "
   end
 end

 def draw?(board)
   if won?(board)
     false
   elsif full?(board)
     true
   end
 end

 def over?(board)
   if won?(board) || full?(board) || draw?(board)
     true
   else
     false
   end
 end

 def winner(board)
    if won?(board)
      winning_positions = won?(board)
      board[winning_positions[0]]
      board[winning_positions[1]]
      board[winning_positions[2]]
    else
      nil
   end
 end

 def play(board)

   until over?(board)
     turn(board)
      end

     if draw?(board)
       puts "Cats Game!"
     else
       puts "Congratulations #{winner(board)}!"
     end
   end
