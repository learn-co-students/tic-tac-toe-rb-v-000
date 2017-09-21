# Helper Method
def position_taken?(board, position)
  if
    board[position] == " " || board[position] == ""
      false
  elsif
    board[position] == nil
      false
  else
    board[position] == "X" || "O"
      true
    end
end

# Define your WIN_COMBINATIONS constant

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

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, token)
    def update_array_at_with(array, index, value)
      array[index] = value
    end
    update_array_at_with(board, index, token)
end

board = [" ", "", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    index_1 = combination[0]
    index_2 = combination[1]
    index_3 = combination[2]

    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]

  if position_1 == "X" &&
     position_2 == "X" &&
     position_3 == "X"
     return combination

   elsif
     position_1 == "O" &&
     position_2 == "O" &&
     position_3 == "O"
     return combination
   end
 end
    false
 end

 def full?(board)
   index = [0, 1, 2, 3, 4, 5, 6, 7, 8]
   index.each do |position|
     if board[position] == " " || board[position] == ""
       return false
     end
   end
   true
 end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end

def valid_move?(board, position)

  if position_taken?(board, position) == false &&
    position <= 8 && position >= 0
    return true
  else
    false
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
  return "X"
else
  return "O"
end
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
    if valid_move?(board, index) == false
      turn(board)
    else
      move(board, index, current_player(board))
      draw?(board)
    end
    display_board(board)
  end

def turn_count(board)
  board.count("X") + board.count("O")
end

def play(board)
  until over?(board) || draw?(board)
    turn(board)
  end
    if won?(board)
      winner = winner(board)
      puts "Congratulations #{winner}!"
    end
      puts "Cats Game!"
end
