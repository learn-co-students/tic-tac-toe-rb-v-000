WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  return (input.to_i - 1)
end

def move(board, idx, token = "X")
  v = valid_move?(board, idx)
  
  if v
    board[idx] = token
    return v
  end
  
  v
end

def valid_move?(board, idx)
  if !idx.between?(0, 8)
    return false
  end
  
  !position_taken?(board, idx)
end

def position_taken?(board, idx)
  chr = board[idx].strip
  !(chr == "")
end

def turn(board)
  
  puts "Please enter a move: 1-9"
  rtn = gets.strip
  idx = input_to_index(rtn)
  token = current_player(board)
  
  if !move(board, idx, token) 
    turn(board)
  end
  
  display_board(board)
  true
end

def turn_count(board)
  count = 0
  board.each do |elem|
    e = elem.strip
    count += ((e.size == 0) ? 0 : 1)
  end
  count
end

def current_player(board)
  count = turn_count(board)
  
  if count.even?
    return "X"
  else
    return "O"
  end
end
  
def won?(board)
  WIN_COMBINATIONS.each do |arr|
    b_0 = board[arr[0]].strip
    b_1 = board[arr[1]].strip
    b_2 = board[arr[2]].strip
    
    if ((b_0 == b_1) && (b_0 == b_2)) && b_0 != ""
      return [arr[0], arr[1], arr[2]]
    end
  end
  false
end

def full?(board)
  count = 0
  board.each do |elem|
    e = elem.strip
    count += ((e.size == 0) ? 0 : 1)
  end
  count == 9
end

def draw?(board)
  w = won?(board)
  f = full?(board)
  
  if w
    return false
  elsif !w && !f
    return false
  elsif !w && f
    return true
  else
    return false
  end
  
end

def over?(board)
  w = won?(board)
  f = full?(board)
  d = draw?(board)
  
  w || f || d ? true : false
end

def winner(board)
  w = won?(board)
  
  if !w 
    return nil
  else
    return board[w[0]]
  end
  
end

def play(board)
  until (over?(board)) do
    turn(board)
  end
  
  if won?(board)
    winner_ = winner(board)
    puts "Congratulations #{winner_}!"
  else
    puts "Cat's Game!"
  end
end