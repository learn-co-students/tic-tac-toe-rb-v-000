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

def display_board(array)
  puts " #{array[0]} | #{array[1]} | #{array[2]} "
  puts "-----------"
  puts " #{array[3]} | #{array[4]} | #{array[5]} "
  puts "-----------"
  puts " #{array[6]} | #{array[7]} | #{array[8]} "
end

def input_to_index(user_input)
 index =  user_input.to_i - 1
end

def move(board, user_input, player)
 board[user_input] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (position_taken?(board, index) == false && index.between?(0, 8))
    return true
  else
    return false
  end
end

def turn(board)
  input = 0
  index = 0
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input.to_i)
  if valid_move?(board, index) == true &&  position_taken?(board, index) == false
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |move|
  if move == 'X' || move == 'O'
    counter += 1
  end
 end
 return counter
end

def current_player(board)
  count = turn_count(board)
   count.even? == true ? 'X' : 'O'
end

def won?(board)
  WIN_COMBINATIONS.detect { |index_array|
     index_array.all? {|i| board[i] == "X"} || index_array.all? {|i| board[i] == "O"}}
end

def full?(board)
    board.all? { |i| !(i == ' ' || i.nil?) }
end

def draw?(board)
   !(won?(board)) && full?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    if WIN_COMBINATIONS.any? { |index_array| index_array.all? {|i| board[i] == "X" }}
       return 'X'
     else return 'O'
   end
  end
end

def play(board)
  until over?(board)
   turn(board)
  end
  if draw?(board)
    puts 'Cats Game!'
  else
    puts "Congratulations #{winner(board)}!"
  end
end
