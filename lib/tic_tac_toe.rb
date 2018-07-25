
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



def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



def input_to_index(position) 
  position.to_i - 1 #.to_i changes to an integer
end




def move(board, index, value)
 board[index] = value 
end



def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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




def turn_count(board)
  counter = 0 
  board.each do |current_player|
    if current_player == "X" || current_player == "O"
      counter += 1 
    end
  end
  counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
  "X"
else turn_count(board) % 2 == 1 
  "O"
end
end


def won?(board)
  
  WIN_COMBINATIONS.find do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    else
      FALSE
    end
  end
end



def full?(board)
  board.none? do |array|
    array == " " || array == ""
  end
end



def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
 won?(board) || full?(board) 
end
  
def winner(board)
 winning_combo = won?(board)
 if winning_combo 
   board[winning_combo[0]]
  end
end  




def play(board)
  until over?(board) == TRUE
    turn(board)
  end
  if won?(board) == TRUE
    puts "congrats!"
  elsif draw(board) == TRUE
    puts "Its a draw"
  end
end

