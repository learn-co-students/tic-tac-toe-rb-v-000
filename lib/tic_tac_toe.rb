WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



def valid_move?(board, position)
   if position.to_i.between?(1,9) 
     if !position_taken?(board, position.to_i-1)
       true
     end
   end
 end

 #def valid_move?(board, input)
  #input.to_i.between?(1,9) && !position_taken?(board, input.to_i-1)
#end

#this was my original def for valid_move
#def valid_move?(board, position)
  #if board[(position.to_i) - 1] == " "
    #true
  #elsif position_taken?(board, position)
    #false
  #end
#end

def won?(board)
WIN_COMBINATIONS.detect do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      win_combination
    else
    end
  end
end

#def won?(board)
#WIN_COMBINATIONS.detect do |combo|
    #board[combo[0]] == board[combo[1]] &&
    #board[combo[1]] == board[combo[2]] &&
    #position_taken?(board, combo[0])
  #end
#end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) #full?(board)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if !valid_move?(board, input)
    turn(board)
  end
  move(board, input, current_player(board))
  display_board(board)
end

#def turn(board)
  #puts "Please enter 1-9:"
  #input = gets.strip
  #if valid_move?(board, input)
    #move(board, input)
  #else
    #turn(board)
  #end
  #display_board(board)
#end

def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
  elsif board[position] == "X" || board[position] == "O"
    true
  end
end

def current_player(board)
  #turn_count(board) % 2 == 0 ? "X" : "O"
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
      end
    end
turns
end

def move(board, position, char="X")
  board[(position.to_i) - 1] = char

  puts display_board(board)
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end
