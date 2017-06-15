WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #diagonal 1
  [2,4,6], #diagonal 2
  [0,3,6], #vertical 1
  [1,4,7], #vertical 2
  [2,5,8] #vertical 3
]

board = ["X","X","X","O","O","O"," "," "," "]
def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  make_int = user_input.to_i
  number = make_int-1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
  false
else (board[index] == "X") || (board[index] == "O")
  true
end
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
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


def turn_count(display_board)
counter = 0
display_board.each do|space|
  if space == "X" || space == "O"
    counter +=1
  end
end
  counter
end

def current_player(board)
  turn_count(board).odd? ? "O" : "X"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination| # combination on the first loop will equal [0,1,2], which is an array of index values
    board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && board[combination[0]] != " "
  end
end

def full?(board)
  # google all? array iterator
  board.all? do|occupied|
    (occupied == "X" || occupied =="O") && (occupied != " ")
  end
end

def draw?(board)
  if full?(board) && ! won?(board)
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
    while !over?(board)
    turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    end
      if draw?(board)
  puts "Cats Game!"
  end
  end
