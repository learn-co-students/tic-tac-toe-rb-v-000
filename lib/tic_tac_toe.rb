WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]
  ]
def display_board(board)
  board = []
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i -1 
end
def move(board, index, current_player = "X")
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
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  move_count = []
  board.each do |boards|
  if boards == "X" || boards == "O"
      move_count.push(1)
    end
  end
  move_count.length.to_i
end

def current_player(board)
  num = turn_count(board)
  if num % 2 == 0 
    return "X"
  else
    return "O"
  end
end
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
      return win_combo
    elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  !(won?(board)) && (full?(board))
end
def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end 
end  

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  else
    return nil
  end
end
def play(board)
  input = gets
    plays = 0
  until plays == 9 do
    turn(board)
    plays += 1
    puts"
  end
end