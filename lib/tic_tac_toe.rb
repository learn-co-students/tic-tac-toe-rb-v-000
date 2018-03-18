
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

def won?(board)
  winner = false
  who_won = nil
  WIN_COMBINATIONS.each do |current_combination|
    if board[current_combination[0]] == "X" && board[current_combination[1]] == "X" && board[current_combination[2]] == "X"
      winner = current_combination
      who_won = "X"
    elsif board[current_combination[0]] == "O" && board[current_combination[1]] == "O" && board[current_combination[2]] == "O"
      winner = current_combination
      who_won = "O"
    end
  end
  return winner
end
    
def full?(board)
 board.none?{|blank_space| blank_space == " "} 
end

def draw?(board)
  if full?(board) == true && won?(board) == false
  return true
  else 
    return false
  end
end  
  
def over?(board)
  if full?(board) == true || won?(board) != false
    return true
   else return false
end
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
 end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    current_player = current_player(board)
    move(board, index, current_player)
    display_board(board)
  else turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |position|
    if position == "X" || position == "O"
      turn += 1
    end
  end
  return turn
end

def current_player(board)
  turn = turn_count(board)
  if turn % 2 == 0 
    return "X"
  else
    return "O"
  end
end

def won?(board)
  winner = false
  who_won = nil
  WIN_COMBINATIONS.each do |current_combination|
    if board[current_combination[0]] == "X" && board[current_combination[1]] == "X" && board[current_combination[2]] == "X"
      winner = current_combination
      who_won = "X"
    elsif board[current_combination[0]] == "O" && board[current_combination[1]] == "O" && board[current_combination[2]] == "O"
      winner = current_combination
      who_won = "O"
    end
  end
  return winner
end
    
def full?(board)
 board.none?{|blank_space| blank_space == " "} 
end

def draw?(board)
  if full?(board) == true && won?(board) == false
  return true
  else 
    return false
  end
end  
  
def over?(board)
  if full?(board) == true || won?(board) != false || draw?(board) == true
    return true
  else return false
end
end

def winner(board)
winner = false
  who_won = nil
  WIN_COMBINATIONS.each do |current_combination|
    if board[current_combination[0]] == "X" && board[current_combination[1]] == "X" && board[current_combination[2]] == "X"
      winner = current_combination
      who_won = "X"
    elsif board[current_combination[0]] == "O" && board[current_combination[1]] == "O" && board[current_combination[2]] == "O"
      winner = current_combination
      who_won = "O"
    end
  end
  return who_won
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def play(board)
   while over?(board) != true
   turn(board)
  end
  if over?(board) == true
    if winner(board) == "O"
    puts "Congratulations O!"
    elsif winner(board) == "X"
    puts "Congratulations X!"
    elsif draw?(board) == true
      puts "Cat's Game!"
end 
end
end