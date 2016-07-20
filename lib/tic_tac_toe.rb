# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],#top
  [3, 4, 5],#mid
  [6, 7, 8],#bot
  [0, 3, 6],#left vert
  [1, 4, 7],#mid vert
  [2, 5, 8],#right vert
  [0, 4, 8],#slash1
  [2, 4, 6]#slash2
]

def won?(board)

  win_arr = []

  return false if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  WIN_COMBINATIONS.each do |array|

    if (board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X") || (board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O")
      win_arr << array
    end
  end

    if win_arr.length == 0
      return false
    else
      return win_arr[0]
    end
end

def full?(board)
  if board.none? {|i| i == " "}
    return true
  else
    return false
  end
end

def draw?(board)
  if (!won?(board) == true) && (full?(board) == true)
    true
  else
    false
  end
end


def over?(board)
  if won?(board) != false
    return true
  elsif draw?(board) == true
    return true
  elsif full?(board) == true
    return true
  else
    return false
  end
end

def winner?(board)
  if (won?(board) == true) && (win_arr[0][1] == "X" && win_arr[0][2] == "X" && win_arr[0][3] == "X")
    return "X"
  elsif (won?(board) == true) && (win_arr[0][1] == "O" && win_arr[0][2] == "O" && win_arr[0][3] == "O")
    return "O"
  else
    return nil
  end
end

def winner(board)

  if won?(board) != false && draw?(board) == false

    WIN_COMBINATIONS.each do |array|

      if (board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X")
        return board[array[0]]
      elsif (board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O")
        return board[array[0]]
      else
        false
      end
    end
  end
end

def turn_count(board)
  turn_count = 0

  board.each do |x|
    if x != " "
      turn_count += 1
    end
  end
  return turn_count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def display_board(board)
  print " #{board[0]} | #{board[1]} | #{board[2]} \n"
  print "-----------\n"
  print " #{board[3]} | #{board[4]} | #{board[5]} \n"
  print "-----------\n"
  print " #{board[6]} | #{board[7]} | #{board[8]} \n"
end

def input_to_index(user_input)
  user_input.to_i - 1
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
  position = gets.strip

  index = position.to_i - 1
  input_to_index(position)

    if valid_move?(board, index) == true
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
end


=begin
until the game is over
  take turns
end

if the game was won
  congratulate the winner
else if the game was a draw
  tell the players it has been a draw
end
=end


# Define your play method below
def play(board)
#start a loop and call turn. 9 turns
      until over?(board) == true
          turn(board)
      end

      if winner(board) == "X"
        puts "Congratulations X!"
      elsif winner(board) == "O"
        puts "Congratulations O!"
      else
        puts "Cats Game!"
      end
end
