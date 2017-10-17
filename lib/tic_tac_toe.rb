WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left verticle row
  [1, 4, 7], #Middle verticle row
  [2, 5, 8], #Right verticle row
  [0, 4, 8], #L to R diagonal row
  [2, 4, 6]  #R to L diagonal row
]

def display_board(board)
  print " #{board[0]} "
  print "|"
  print " #{board[1]} "
  print "|"
  puts " #{board[2]} "
  puts "-----------"
  print " #{board[3]} "
  print "|"
  print " #{board[4]} "
  print "|"
  puts " #{board[5]} "
  puts "-----------"
  print " #{board[6]} "
  print "|"
  print " #{board[7]} "
  print "|"
  print " #{board[8]} "
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index = index.to_i
  if index.between?(0, 8) && position_taken?(board, index) == false
    true
  else position_taken?(board, index) == true
    false
  end
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
  turn_count(board).even? ? "X" : "O"
  #Same as
  #if turn_count(board) % 2 == 0
    # "X"
  #else
    #"O"
  #end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    position_taken?(board, win_combination[0]) && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[2]] == board[win_combination[0]]
  end
end

def full?(board)
  board.all? {|full_board| full_board == "X" || full_board == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
