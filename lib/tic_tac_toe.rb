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


def input_to_index(input)
   input.to_i - 1
end

def move(board, index, char)
  board[index] = char
  display_board(board)
end


def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
 end
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
  turn = 0
  board.each do |position|
    if position == "X" || position == "O"
      turn += 1
    end
  end
  turn
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(board, combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
  end
end

def full?(board)
  board.all? do |spot| #for all the |spot| on the board array
    spot == "X" || spot == "O"  #the |spot| must be an "X" OR an "O"
  end #return TRUE if ALL elements of board pass the above, FALSE if any element fails
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
  if won?(board)
    true
  elsif full?(board)
    true
  elsif draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
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
