require 'pry'
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

def move(board, position, char)
   board[position] = char
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
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end
  
def play(board)
  turns = 9 
  counter = 0 
  loop do
    counter = counter + 1 
    turn(board)
    if counter == turns
      break
      puts "Game Over"
  end
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
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [2,4,6]  #Right start diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]
    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]
    position_1 == position_2 && position_2 == position_3 && position_1 != " "
    
  end
end 

def full?(board)
  !board.any? { |x| x == " " }
 end


def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end  

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end

def play(board)
  until over?(board)
    puts "Your Turn"
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    return nil
  end
end