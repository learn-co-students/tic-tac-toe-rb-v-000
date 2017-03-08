WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def won?(array)
  WIN_COMBINATIONS.detect do |winner_set|
    if array[winner_set[0]] == array[winner_set[1]] &&
       array[winner_set[1]] == array[winner_set[2]] &&
       position_taken?(array, winner_set[0])
       return winner_set
    end
  end
end

def full?(array)
 array.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(array3)
  draw?(array3) || won?(array3)
end

def input_to_index(input)
  input.to_i - 1
end

def turn(board)
    puts "Please enter 1-9:"
    answer = gets.chomp
    index = input_to_index(answer)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      #puts "That is an invalid entry!"
      turn(board)
    end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def current_player(array12)
  turn_count(array12) % 2 == 0?"X":"O"
end

def turn_count(array7)
array7.count{|token| token == "X" || token == "O"}
end
#this "token" needs to be modified so it talks to the game?
def move(array, index, token)
  array[index] = token
end

def winner(array4)
  if three_that_won = won?(array4)
    array4[three_that_won.first]
  end
end
