# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8],
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8],
                    [0, 4, 8],
                    [2, 4, 6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Define your play method below
def play(board)
  total_turns = 0
  until total_turns == 9
    turn(board)
    total_turns += 1
  end
end

def turn_count(board)
  board.count { |e| e == "X" || e == "O" }
end

def current_player(board)
  turn_count(board)%2 == 0? return "X" : return "O"
end

def turn(board)
  # Ask one player to make a move
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, token = "X")
    display_board(board)
  else
    while valid_move?(board, index) == false
      puts "That is not a valid move!"
      puts "Please enter 1-9:"
      input = gets.chomp
      index = input_to_index(input)
    end
  end
end

def input_to_index(input)
  if input.to_i.is_a? Integer
    index = input.to_i - 1
  else
    return -1
  end
end

# helper method for #turn to determin if the move is valid
def valid_move?(board, index)
  if index.between?(0, 8) && (position_taken?(board,index) == false)
    return true
  else
    return false
  end
end

# helper method for #valid_move?(board, index)
def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false
  else
    return true
  end
end

def move(board, index, token)
  board[index] = token
end

def display_board(board)
  puts " " + board[0] + " | " + board[1] + " | " + board[2] + " "
  puts "-----------"
  puts " " + board[3] + " | " + board[4] + " | " + board[5] + " "
  puts "-----------"
  puts " " + board[6] + " | " + board[7] + " | " + board[8] + " "
end

def won?(board)
  w = WIN_COMBINATIONS.detect {|combo| combo[0] == combo[1] && combo[1] == combo[2] && position_taken?(board, combo[0])}
  if w != nil
    return true
  else
    return false
  end
end

def winner(board)
  unless won?(board)
    return nil
  else
    winning_combo = WIN_COMBINATIONS.detect {|combo| combo[0] == combo[1] && combo[1] == combo[2] && position_taken?(board, combo[0])}
    return winning_combo[0]
  end
end

def full?(board)
  board.all? {|index| position_taken?(board, index)}
end

def draw?(board)
  (won?(board) == false) && (full?(board) == true)
end

def over?(board)
  won?(board) || draw?(board)
end
