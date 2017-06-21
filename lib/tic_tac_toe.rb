def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end
  draw?(board)
  if draw?(board)
    puts "Cats Game!"
  end
end



WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

# Define display_board that accepts a board and prints
# out the current state.

board = [" "," "," "," "," "," "," "," "," "]
def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board (board)


# code your input_to_index and move method here!
def input_to_index(input)
  #convert string to integer
 input.to_i - 1
end


def move(board, index, input_value)
  board[index]= input_value
end


# code your #valid_move? method here
def valid_move?(board,index)
    if position_taken?(board,index) != true && index.between?(0,8)
      true
    else
       false
        #execute something else
    end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
if board[index] == " " || board[index] == ""
   false
elsif board[index] == nil
  false
else
  true
end
end




def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, input_value = current_player(board))
    display_board(board)
  else
    turn(board)
  end
end



def turn_count (board)
count = 0

board.each do |turn|
  if turn == "X" || turn == "O"
    count+= 1
  end
end
return count
end

def current_player(board)

if turn_count(board).even? == true
  return "X"
elsif turn_count(board).odd? == true
  return "O"
end

end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]


    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif
        position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)

  if board.none?{|i| i == " "}
    return true
  else false
  end
end

def draw?(board)
  if (!won?(board)) && (full?(board))
    return true
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    combo = won?(board)
    number = combo[0]
    return board[number]
  end
end
