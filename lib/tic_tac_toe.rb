WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8], # bottom row
  [0,3,6], #left column
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

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, character = current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, num, character)
  board[num] = character
end

def current_player(board)
    counter = turn_count(board)
    counter % 2 == 0 ? "X" : "O" 
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


##board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def won?(board)
  position_1 = 0
  position_2 = 0
  position_3 = 0

  WIN_COMBINATIONS.detect do |combo|

    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]


   if (position_1 == "X" && position_2 == "X" && position_3 == "X")
     return combo
   elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
     return combo
   end
 end
 return nil
end


def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end


def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end




# Define your play method below
=begin def play(board)
  counter = 1
  until counter == 10
    counter += 1
    turn(board)
  end
end
=end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  return counter
end



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
