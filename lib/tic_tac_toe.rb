WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [0,4,8],
  [2,4,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
input.to_i - 1
end

def move(array, index, player)
  array[index] = player
end

# code your #position_taken? method here!
def position_taken?(board, index)
  if board[index] == " "
    return false
  elsif board[index] ==""
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  else
    return false
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == true
    return false
  elsif index.between?(0, 8)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player(board)
    if valid_move?(board, index) == true
      move(board, index, player)
      display_board(board)
    else
      input = gets.strip
      index = input_to_index(input)
      valid_move?(board, index)
      puts "Please enter 1-9:"
    end
end

def turn_count(board)
  counter = 0

  board.each do |cell|
    if cell == "X" || cell == "O"
      counter += 1
    end
  end

  counter
end

def current_player(board)
  if turn_count(board)%2==0
    "X"
  else
    "O"
  end
end

def won?(board)
  for x in WIN_COMBINATIONS
    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]
    p1 = board[win_index_1]
    p2 = board[win_index_2]
    p3 = board[win_index_3]

    if p1 == "X" && p2 == "X" && p3 == "X"
      return x
    elsif p1 == "O" && p2 == "O" && p3 == "O"
      return x
    end
  end
  false
end

def full?(board)
  board.all?{|cell| cell != ' '}
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  for x in WIN_COMBINATIONS
    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]
    p1 = board[win_index_1]
    p2 = board[win_index_2]
    p3 = board[win_index_3]

    if p1 == "X" && p2 == "X" && p3 == "X"
      return 'X'
    elsif p1 == "O" && p2 == "O" && p3 == "O"
      return 'O'
    end
  end
  nil
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
