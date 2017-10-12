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


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  num = user_input.to_i
  return num - 1
end

def move(array, index, char)
  array[index]=char
end

def position_taken?(board, position)
  amin = board[position]
  if amin == " "
    return false
  elsif amin == ""
    return false
  elsif amin == "X" || amin == "O"
    return true
  else amin == nil
    return false
  end
end

def valid_move?(board, position)
  if position >= 9 || position < 0
    return false
  elsif position < 9
    !(position_taken?(board, position))
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |box|
    if box != " "
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 == 1
    return "O"
  end
end

def full?(board)
  if board.all?{|n| (n == "X" || n == "O")}
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) == true
    if won?(board) == true
      return false
    else
      return true
    end
  else
    return false
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|n| board[n] == "X"}
      return true
    elsif combo.all?{|n| board[n] == "O"}
      return true
    end
  end
  return false
end


def over?(board)
  if draw?(board) == true
    return true
  elsif board.all?{|n| n == " "}
    return false
  elsif won?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  x = board.select{|n| n == "X"}
  o = board.select{|n| n == "O"}
  if x.length > o.length
    return "X"
  elsif x.length < o.length
    return "O"
  else
    return nil
  end
end

def play(board)
  loop do
    if over?(board) == true
      if winner(board) == "X"
        puts "Congratulations X!"
        break
      elsif winner(board) == "O"
        puts "Congratulations O!"
        break
      elsif draw?(board) == true
        puts "Cat's Game!"
        break
      end
    else
      turn(board)
    end
  end
end
