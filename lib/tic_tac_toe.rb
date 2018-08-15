board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
WIN_COMBINATIONS = [[0,1,2],[3,4,5], [6,7,8],[0,3,6],[1,4,7], [2,5,8],[0,4,8],[2,4,6]]
 
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input = input.to_i - 1
end
 
def move(board, index, token)
  board[index.to_i] = token
end  
  
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
end
end

def valid_move?(board, position_taken)
  if position_taken.between?(0,8) != true || board[position_taken] == "X"
    return false
  else 
    return true
end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, token = "X")
    display_board(board)
  else
    turn(board)
end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
  end
end
counter
end

def current_player(board)
  if turn_count(board).even? == true 
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |winner_array|
    
    win_index_1 = winner_array[0]
    win_index_2 = winner_array[1]
    win_index_3 = winner_array[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 === "X" && position_2 == "X" && position_3 == "X"
      return winner_array
      
      elsif position_1 === "O" && position_2 == "O" && position_3 == "O"
        return winner_array
       end
  end
  false
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winner_array = won?(board)
    board[winner_array.first]
  end
end

def play(board)
  until over?(board)
  turn(board)
end
  winner = ["X", "O"]
  if won?(board)
    puts "Congratulations #{winner[index]}!"
    
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

