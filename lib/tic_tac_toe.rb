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

def input_to_index(number)
 number.to_i - 1
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

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
 # if turn_count(board) % 2 == 0
 #   "X"
 # else "O"
 # end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
 counter
end

def won?(board)
 WIN_COMBINATIONS.detect do |combo|
    element_1 = combo[0]
    element_2 = combo[1]
    element_3 = combo[2]
    index_1 = board[element_1]
    index_2 = board[element_2]
    index_3 = board[element_3]
    index_1 == index_2 && index_2 == index_3 && position_taken?(board, element_1)
  end
end

def full?(board)
 board.all? do |index|
   index == "X" || index == "O"
  end
 end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
full?(board) || won?(board) || draw?(board)
end

def winner(board)
   if winning = won?(board)
   board[winning[0]]
 end
end

def play(board)
 until over?(board)
   turn(board)
 end

  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else draw?(board)
   puts "Cat's Game!"
  draw?(board)
  end
 end
