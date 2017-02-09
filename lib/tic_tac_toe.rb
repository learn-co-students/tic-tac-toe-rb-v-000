WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # abajo horizontal
  [0,3,6], # izquierda vertical
  [1,4,7], # mitad vertical
  [2,5,8], # derecha vertical
  [0,4,8], # diagonal de izquierda a derecha
  [2,4,6]  # diagonal de derecha a izquierda
]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i
  user_input=(user_input - 1)
end

def move(array, index, value)
  array[index]=value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  if index.between?(0,8)
     if !position_taken?(board,index)
       true
     end
   end
end

def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
   if valid_move?(board, index)
     true
        value = current_player(board)
        move(board, index, value)
        display_board(board)
   else
     #turn(board) #tried and caused an infinite loop
     puts "Please enter 1-9:"
       input = gets.strip
       index = input_to_index(input)
   end
 end

def turn_count(board)
  board.count{|player| player == "X" || player == "O"}
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else turn_count(board).odd?
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination_aray|
   if (
      (board[win_combination_aray[0]] == "X" && board[win_combination_aray[1]] == "X" && board[win_combination_aray[2]] == "X" ) ||
      (board[win_combination_aray[0]] == "O" && board[win_combination_aray[1]] == "O" && board[win_combination_aray[2]] == "O" )
      )
      winner = board[win_combination_aray[0]]
      return win_combination_aray
    else false
    end
  end
  return false
end

def full?(board)
  board.all?{|player| player == "X" || player == "O"}
end

def draw?(board)
   if !won?(board) && full?(board)
      true
   else
      false
   end
 end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
   nil
  elsif board[won?(board)[0]] == "X"
     "X"
  else board[won?(board)[0]] == "O"
     "O"
  end
end

def play(board)
  #input = gets
  until over?(board)
      turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      #turn(board)
      puts "Cats Game!"
    else
      turn(board)
    end
end
