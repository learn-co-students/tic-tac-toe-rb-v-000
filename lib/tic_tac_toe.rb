# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win = combo.all? do |pos|
      board[pos] == "X"
    end
    if win
      return combo
    end
    win = combo.all? do |pos|
      board[pos] == "O"
    end
    if win
      return combo
    end
  end
  nil
end

def full?(board)
  full = board.all? do |spot|
    spot != " "
  end
  full
end

def draw?(board)
  if won?(board) != nil
    return false
  end
  if full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != nil
    board[won?(board)[0]]
  else
    nil
  end
end

def valid_move?(board, pos)
  if pos == pos.to_i.to_s
    board[pos.to_i-1]==" "
  else
    false
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your move method here!
def move(board, num, mark="X")
  num = num.to_i
  board[num-1]=mark
end

def turn(board)
  puts "Please enter 1-9:"
  pos = gets.strip
  if valid_move?(board,pos)
    move(board,pos, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |spot|
    if spot != " "
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # mid column
  [2,5,8], # right column
  [0,4,8], # diag 1
  [6,4,2] # diag 2
]
