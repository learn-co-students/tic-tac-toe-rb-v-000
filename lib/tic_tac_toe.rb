def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

  
  WIN_COMBINATIONS = [
    
    [0, 1, 2], # Top row 
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left Column
    [1, 4, 7], # Middle Column
    [2, 5, 8], # Right Column
    [0, 4, 8], # Diagnol Left
    [2, 4, 6], # Diagnol Right
    ]
 

    
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
 turn_count(board).odd? ? "O" : "X"
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

 def won?(board)   
    win_index_1 = WIN_COMBINATIONS[0]
    win_index_2 = WIN_COMBINATIONS[1]
    win_index_3 = WIN_COMBINATIONS[2]
    win_index_4 = WIN_COMBINATIONS[3]
    win_index_5 = WIN_COMBINATIONS[4]
    win_index_6 = WIN_COMBINATIONS[5]
    win_index_7 = WIN_COMBINATIONS[6]
    win_index_8 = WIN_COMBINATIONS[7]
  
  if win_index_1.all? { |index| board[index] == "X"} || win_index_1.all? {|index| board[index] == "O"}
    win_index_1
  elsif win_index_2.all? {|index| board[index] == "X" } || win_index_2.all? {|index| board[index] == "O"}
    win_index_2
  elsif win_index_3.all? {|index| board[index] == "X" } || win_index_3.all? {|index| board[index] == "O"}
    win_index_3
  elsif win_index_4.all? {|index| board[index] == "X" } || win_index_4.all? {|index| board[index] == "O"}
    win_index_4
  elsif win_index_5.all? {|index| board[index] == "X" } || win_index_5.all? {|index| board[index] == "O"}
    win_index_5
  elsif win_index_6.all? {|index| board[index] == "X" } || win_index_6.all? {|index| board[index] == "O"}
    win_index_6
  elsif win_index_7.all? {|index| board[index] == "X" } || win_index_7.all? {|index| board[index] == "O"}
    win_index_7
  elsif win_index_8.all? {|index| board[index] == "X" } || win_index_8.all? {|index| board[index] == "O"}
    win_index_8
  else
     false 
  end
end

def full?(board)
  if WIN_COMBINATIONS.all? do |win_combinations|
    win_combinations.all? { |index| position_taken?(board,index)}
  end
    true 
  else
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board)
    false
  end
end

def over?(board)
 if won?(board) || draw?(board) || full?(board)
   true
 end
end

def winner(board)
  win_combo = won?(board) 
  if won?(board)
    board[win_combo[0]]
  end
end


def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) 
      puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
      puts "Cat's Game!"
  end
end