# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # 1st column
    [1,4,7],  # 2nd column
    [2,5,8],  # 3rd column
    [0,4,8],  # diagonal down
    [2,4,6]   # diagonal up
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(array,index,value)
  array[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# code your #valid_move? method here
def valid_move?(board, index)
  (position_taken?(board, index) == true || index.between?(0,board.size-1) == false)? false : true
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    puts "That's not valid input"
    turn(board)
  end
  display_board(board)
end

def current_player(board)
  return (turn_count(board) % 2 == 0)? "X":"O"
end

def turn_count(board)
  return board.select {|index| index != "" && index != " "}.size
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    positions = [board[combo[0]],board[combo[1]],board[combo[2]]]
      if (positions[0] == "X" && positions[1] == "X" && positions[2] == "X") || (positions[0] == "O" && positions[1] == "O" && positions[2] == "O")
        return combo
      end
  end
  return false
end

def full?(board)
  board.all? {|position| !(position.nil? || position == " ")}
end

def draw?(board)
  (won?(board) == false && full?(board) == true)? true : false
end

def over?(board)
  (won?(board) != false || draw?(board) == true)? true : false
end

def winner(board)
  won?(board) == false ?  nil : board[won?(board)[0]]
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  (won?(board) != false)? (puts "Congratulations #{winner(board)}!" ): (puts "Cat's Game!")
end
