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

  while !over?(board)
    turn(board)
  end

  if won?(board)
    wplayer = winner(board)
    puts "Congratulations #{wplayer}!"
  elsif draw?(board)
    puts "Cat\'s Game!"
  else
    puts "Keep on playing!"
  end
end

def turn_count(board)
  board.count { |e| e == "X" || e == "O" }
end

def current_player(board)
  turn_count(board)%2 == 0? "X" : "O"
end

def turn(board)
  # Ask one player to make a move
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  player = current_player(board)

  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    puts "That is not a valid move!"
    turn(board)
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

def move(board, index, player)
  board[index] = player
end

def display_board(board)
  puts " " + board[0] + " | " + board[1] + " | " + board[2] + " "
  puts "-----------"
  puts " " + board[3] + " | " + board[4] + " | " + board[5] + " "
  puts "-----------"
  puts " " + board[6] + " | " + board[7] + " | " + board[8] + " "
end

def won?(board)
  win_line = WIN_COMBINATIONS.detect {|line| board[line[0]] == board[line[1]] && board[line[1]] == board[line[2]] && position_taken?(board, line[0])}
  if win_line != nil
    return win_line
  else
      return false
  end
end

def winner(board)
  win_line = WIN_COMBINATIONS.detect {|line| board[line[0]] == board[line[1]] && board[line[1]] == board[line[2]] && position_taken?(board, line[0])}
  if win_line != nil
    return board[win_line[0]]
  else
      return nil
  end
end

def full?(board)
  board.all? {|item| item == "X" || item == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end
