
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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board,index,ox)
    board[index] = ox
end

def position_taken?(board,index)
  index = index
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board,index)
    true
  end
end

def input_to_index(user_input)
  (user_input.to_i) - 1
end


#def turn(board)

#  input = gets.strip
#  index = input_to_index(input)

#  until valid_move?(board,index) do
#    move(board,index,current_player(board))
#  end
#end

def turn(board)
  while true
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board,index)
      move(board,index,current_player(board))
      display_board(board)
      break
    end
  end
end


def turn_count(board)
  turn_counter = 0
  board.each do |element|
    if element != " "
      turn_counter += 1
    end
  end
  return turn_counter
end

def current_player(board)
  if turn_count(board).odd?
    "O"
  else
    "X"
  end
end

def won?(board)
  board_collection_X = board.each_index.select {|i| board[i] == "X"}
  board_collection_O = board.each_index.select {|i| board[i] == "O"}

  WIN_COMBINATIONS.each do |element|
    return element if (element - board_collection_X).empty? ||
                      (element - board_collection_O).empty? #array - array available
    end
  return false
end

def full?(board) #finished
  board.none?{|element| element == " "}
end

def draw?(board) #done
  if full?(board) && !(won?(board))
    true
  else
    false
  end
end

def over?(board) #done
  arr = [won?(board),draw?(board),full?(board)]
  arr.any?{|arr_ele| arr_ele == true}
end

def winner(board)
  #binding.pry
  if winning_array = won?(board)
      board[winning_array[0]]
  end
end

def play(board)
  until over?(board) || won?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
