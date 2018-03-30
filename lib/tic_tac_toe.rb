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
  #prints first line of board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  
  #prints line in between 1st row and 2nd row
  puts "-----------"
  
  #prints second line of board
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  
  #prints line in between 2nd row and 3rd row
  puts "-----------"
  
  #prints third line of board
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (index)
   return index.to_i - 1
end

def move (board , plyr_index , plyr_char)
  board[plyr_index] = plyr_char
  board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
end

def turn_count (board)
  turn_cnt = 0
  board.each do |element|
    if element == "X" || element == "O"
      turn_cnt += 1
    end
  end
  turn_cnt
end

def current_player (board)
  turn_count(board).even? ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  player_input = gets.strip
  index = input_to_index(player_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    #Win Indicies
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    #elements in each position
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    #Check to make sure none are spaces
    position_not_taken = position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)
    
    #Check to see if all 3 elements are the same and are not spaces.
    position_1 == position_2 && position_2 == position_3 && position_not_taken
    
  end
end

def full?(board)
  board.none? {|element| element == " "}
end

def draw?(board)
  won?(board).nil? && full?(board)
end

def over?(board)
  !won?(board).nil? || draw?(board) || full?(board)
end

def winner(board)
   if !won?(board).nil?
     board[won?(board)[0]]
   end
end

def play (board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat\'s Game!"
  end
end
