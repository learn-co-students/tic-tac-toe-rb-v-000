

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn_count(board)
  return board.count("X") + board.count("O")
end


def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
     true
  else

     false
  end
end


def input_to_index(input)

  return(input.to_i - 1)
end

def move(board, index, token)
  board[index] = token
end

def turn(board)
  puts "Player #{current_player(board)}, please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board,index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Invalid move.  Try again."
    turn(board)
  end
end

def current_player(board)
  if (turn_count(board)).even?
    current_player = "X"
  else
    current_player = "O"
end

end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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


def won?(board)
  if board.count("X") + board.count("O") == 0     # initial check for a empty board
    return false
  else
      WIN_COMBINATIONS.each do |win_combination|
        position_1 = board[win_combination[0]]
        position_2 = board[win_combination[1]]
        position_3 = board[win_combination[2]]
          if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combination
          end
      end
  false
  end
end


def full?(board)
  if board.count("X") + board.count("O") == 9
    return true
  end
  false
end

def draw?(board)
  if won?(board)
     return false
  elsif full?(board)
      return true
  end
  false
end

def over?(board)
  if won?(board) || draw?(board)
     true
  else
    false
  end
end

def winner(board)
  if won?(board)
      return board[won?(board)[0]]
    else
      return  nil
    end
end


def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
      puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
    end

puts "The Game Has Ended."
end
