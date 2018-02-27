board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5], 
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

def input_to_index(input)
  input.to_i - 1
end 

def player_token
  player_token = "X" || "O"
end
  
def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil 
    false 
  else 
    true 
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  i = gets.strip
  index = input_to_index(i)
  m = valid_move?(board, index)
  if m == true
    move(board, index, player_token)
  else m == false
    until m == true
    puts "Sorry, that was an invalid move.  Please enter 1-9:"
    i = gets.strip
    index = input_to_index(i)
    m = valid_move?(board, index)
    move(board, index, player_token)
  end
end
display_board(board)
end 

def turn_count(board)
  counter = 0 
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1 
    end 
  end
  counter
end

def current_player(board)
  if turn_count(board)%2 == 0 
    current_player = "X"
  else
    current_player = "O"
  end
  return current_player
end
  
  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end
  
  def full?(board)
    if board.all? {|i| i == "X" || i == "O"}
      return true
    end
  end
  
  def draw?(board)
    if !won?(board) && full?(board)
      return true
    end 
  end
  
  def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    end 
  end
  
  def over?(board)
    if won?(board) || draw?(board)
      return true
    end 
  end 
  
  def play(board)
  play = 0
  input = gets
  until over?(board)
  turn(board)
end 
  if won?(board)
  winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
  puts "Cat's Game!"
end
end 
      
      
