WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[2, 5, 8],[1, 4, 7],[0, 3, 6],[0, 4, 8],[6, 4, 2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts  "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  n = input.to_i 
  n - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  x = board[index]
  if x == " " || x == "" || x == nil
    false
  else x == "X" || x = "O"
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) == true && position_taken?(board, index) == false
        true
    else
        false
    end
end

def turn(board)
  counter = 0
  until counter.between?(1,9)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    x = index + 1 
    x += counter
  if valid_move?(board, index) == true
    move(board, index, value = "X")
    display_board(board)
    break
end
end
end

def turn_count(board)
  board.each do |entry|
    if entry == " "
      board.delete entry 
    end
  end
  board.length
end

def current_player(board)
  if turn_count(board).even?
    "X"
    elsif turn_count(board).odd?
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||  board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" 
    end
  end
  
def full?(board)
  board.none? (" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  x = won?(board).to_a[0]
  if over?(board) == false
    return nil
  elsif board[x] == "X"
    return "X"
  elsif board[x] == "O"
    return "O"
    end
  end
  
def play(board)
  input = gets
  while over?(board) != true
    turn(board)
    end
  if won?(board) == true
    return "Congratulations!"
  elsif draw?(board) == true
    return "It has been a draw."
    end
  end
