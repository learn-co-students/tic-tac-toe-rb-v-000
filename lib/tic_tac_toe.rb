WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def input_to_index(input)
  input.to_i - 1
end

def move(board, input_to_index, token)
 board[input_to_index] = token
 turn_count(board)
 display_board(board)
end

def position_taken?(board, input)
  if board[input] == " " || board[input] == "" || board[input] == nil
     false
    else board[input] == "X" || board[input] == "O"
     true
  end
end


def valid_move?(board, input)
    if input.between?(0,8) && !position_taken?(board, input)
      true
    end
end

def turn(board)
  puts "Please enter 1-9:"
  i = gets.strip
  input = input_to_index(i)
  m = valid_move?(board, input)
  if m == true
    move(board, input, current_player(board))
  else m == false
    until m == true
      puts "Sorry, that was an invalid move. Please enter 1-9:"
      i = gets.strip
      input = input_to_index(i)
      m = valid_move?(board, input)
      move(board, input, current_player(board))
    end
  end
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |token|
    if token == "X"|| token == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board) % 2==0 ? "X": "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") ||
     (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
  end
end
def full?(board)
  board.all?{|character| character == "X" || character == "O"}
end

def draw?(board)
  won?(board) == nil && full?(board) == true
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if over?(board) == false
    winnner = nil
  elsif won?(board).all?{|index| board[index] == "X"}
    winner = "X"
  elsif won?(board).all?{|index| board[index] == "O"}
    winner = "O"
  end
end

def play(board)
  turn(board) while over?(board) == false
  if won?(board)
    puts "Congratulations #{winner(board)}!"
end
  if draw?(board)
    puts "Cats Game!"
  end
end
