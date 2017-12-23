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

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
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
  token = current_player(board)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |turns|
    if turns == "X" || turns == "O"
  counter += 1
  end
  end
  return counter
end


def current_player(board)
num = turn_count(board)
  if num % 2 == 0
  return "X"
  else
    return"O"
  end
end


  def won?(board)
    WIN_COMBINATIONS.each do |win|
    test_position1 = win[0]
    test_position2 = win[1]
    test_position3 = win[2]

    position1 = board[test_position1]
    position2 = board[test_position2]
    position3 = board[test_position3]

      if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
           return win
        end
    end
    false
  end


  def full?(board)
    board.all? do |token|
     token == "X" || token == "O"
    end
  end


  def draw?(board)
    if !won?(board) && full?(board)
      return true
    else
      false
    end
  end


  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    end
  end


  def winner(board)
    if winning_combo = won?(board)
      return board[winning_combo[0]]
    else
      return nil
  end
  end


def play(board)
  until over?(board) || draw?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
end
end
