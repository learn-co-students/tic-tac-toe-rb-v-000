WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8], # Third Column
  [0,4,8], # Left Diagonal
  [2,4,6] # Right Diagonal
]

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
def won?(board)
  x = "X";
  o = "O";

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0];
    win_index_2 = win_combination[1];
    win_index_3 = win_combination[2];

    position_1 = board[win_index_1];
    position_2 = board[win_index_2];
    position_3 = board[win_index_3];

    if ((position_1 == x && position_2 == x && position_3 == x) ||
      (position_1 == o && position_2 == o && position_3 == o))
        return win_combination;
      else
        false
    end
  end
  #returning the WIN_COMBINATIONS array
  false; #explicitly tell ruby to return false if we've cycled through the board and no win combinations can be found
end

def full?(board)
  board.all? {|position| position_taken?(board, board.index(position))}
end
def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end
def over?(board)
  draw?(board) || won?(board)
end
def winner(board)
  winner = won?(board)
  if won?(board) == false
    nil
  else
    board[winner[0]]
  end
end
def current_player(board)
  #if turn_count(board) %  == 0
    num = turn_count(board)
    if num % 2 == 0
      return "X"
    else
      return "O"
    #puts "divisible by 2"
    end
end
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X"
  counter += 1
  elsif space == "O"
  counter += 1
end
  end
  return counter
end
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
