# Define your WIN_COMBINATIONS constant
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

def input_to_index(position)
  index = position.to_i - 1
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
  turn_count = 0 
  board.each do |position|
    if position == "X" || position == "O"
      turn_count += 1 
    end
  end
  turn_count  
end

def current_player(board)
  turn_count(board).even? ?  "X" :  "O"
end

def won?(board)
    WIN_COMBINATIONS.detect do |winning_combo|
      #winning_combo could be [0, 1, 2], [3, 4, 5]...
      (board[winning_combo[0]] == board[winning_combo[1]]) && 
        (board[winning_combo[1]] == board[winning_combo[2]]) && (board[winning_combo[0]] != " ")
    end
  end
  
  def full?(board)
    board.all? do |position|
      position == "X" || position == "O"
    end
 end

def draw?(board)
  #if board is full and there are no winning combos return TRUE
  full?(board) && !won?(board)
end
  
def over?(board)
 full?(board) || won?(board)
end

def winner(board)
    #look in won? & return the value of any element oF the winning_combo: 
    #I randomly chose to use winning_combo[0]
  
  if won?(board)
    if board[won?(board)[0]] == "X"
      "X"
    else board[won?(board)[0]] == "O"
      "O"
    end
  else
    return nil
  end
end




