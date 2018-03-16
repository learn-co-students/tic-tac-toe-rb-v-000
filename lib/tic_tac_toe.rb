WIN_COMBINATIONS = [
[0, 1, 2], #top row 
[3, 4, 5], #middle row
[6, 7, 8], #bottom row 
[0, 3, 6], #first column 
[1, 4, 7], #second column 
[2, 5, 8], #third column
[0, 4, 8], #diagonal
[2, 4, 6] #other diagonal
]

def display_board(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
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
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false 
    
  else (board[index] == "X") || (board[index] == "O")
    return true
  end
end

def valid_move?(board, index)
  if (position_taken?(board, index) == false) && (index.between?(0, 8) == true)
    return true
  else 
    return false
  end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
      if valid_move?(board, index) == true
        move(board, index, current_player(board))
      else
        puts "Please enter 1-9:"
        input = gets.strip
      end  
    display_board(board)
end

def turn_count(board)
  counter = 0 
  board.each do |position|
    if position != " "
      counter += 1 
    end
  end
  return counter
end 

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else
    return "O"
  end 
end 

def won?(board)
    WIN_COMBINATIONS.each do |combos|
      position_1 = board[combos[0]]
      position_2 = board[combos[1]]
      position_3 = board[combos[2]]
      if ((position_1 == "X") && (position_2 == "X") && (position_3 == "X")) || ((position_1 == "O") && (position_2 == "O") && (position_3 == "O"))
        return combos
      end
    end
  nil 
end 

def full?(board)
 board.all? do |space|
  (space == "X") || (space == "O")
  end
end

def draw?(board)
  if !won?(board) && (full?(board) == true)
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winning_combo = won?(board)
  if won?(board) 
    if
      board[winning_combo[0]] == "X"
        return "X"
    elsif 
      board[winning_combo[0]] == "O"
        return "O"
    else
      return nil 
    end 
  end 
end

def play(board)
 while over?(board) == false
    turn(board)
  end 
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat\'s Game!"
  end
end 