#game methods will be coded here

WIN_COMBINATIONS = [
  [0,1,2], #baby array
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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


def move(board, index, token)
board[index] = token
end


def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end


def valid_move?(board, index)

  if  index.between?(0, 8)  && (!position_taken?(board, index) )
    return true
  end

end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token =  current_player(board)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else !(valid_move?(board, index))
    puts "Please enter again 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
end

def turn_count(board)
counter = 0
board.each do |token|
  if token == "X" || token =="O"
  counter += 1
end
end
counter
end

def current_player(board)

if turn_count(board).even?
   "X"
else
   "O"
 end
end

#check to see how game was won
def won?(board)

WIN_COMBINATIONS.find do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])

  end
 #no need to
 #   puts, because logic should evaluate T or F
end

#check to see if board is full
def full?(board)

  board.all? do |space|
 (space == "X" || space == "O")
  end

end

#method to check for stalemate

def draw?(board)
  full?(board) && !(won?(board))
end

#check to see if there are no more moves

def over?(board)
  won?(board) || draw?(board) || full?(board)
end


  #check to see who won in any board, returns nil if no one won
 def winner(board)

if won?(board)
  return board[won?(board)[0]]
end
end



def play(board)

  while !over?(board)
    turn(board)
end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat\'s Game!"
  end
end
