WIN_COMBINATIONS = [
    #Horizontal
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #Vertical
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #Diagonal
    [2,4,6],
    [0,4,8]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, value = "X")
  board[position.to_i-1] = value
end

def position_taken?(board, position)
  if board[position.to_i] == nil || board[position.to_i] == " " || board[position.to_i] == ""
    false
  else
    true
  end
end

def valid_move?(board, position)
  if position.to_i.between?(1,9) && position_taken?(board, position.to_i-1) == false
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  until valid_move?(board, position) == true
    puts "Please enter 1-9:"
    position = gets.strip
  end
  move(board, position.to_i, current_player(board))
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |moves|
    if moves == "X" || moves == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] && position_taken?(board, win[0])
  end
end

def full?(board)
  !board.any? do |empty|
    empty == " "
  end
end

def draw?(board)
  if !won?(board) == false
  elsif full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winner = won?(board)
  if winner
    board[winner[0]]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end


