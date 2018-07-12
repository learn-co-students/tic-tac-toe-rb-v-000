WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
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
  return input.to_i - 1
end

def move(board, index, char)
  board[index]=char
end

def position_taken?(board,index)
  return board[index]=="X"||board[index]=="O"
end

def valid_move?(board,index)
  if !index.between?(0,8)
    return false
  elsif position_taken?(board,index)
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  num = 0
  board.each do|i|
    if i =="X"||i=="O"
      num += 1
    end
  end
  return num
end

def current_player(board)
  if turn_count(board)%2==0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board)||full?(board)||draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if draw?(board)||!over?(board)
    return nil
  end
  if board[won?(board)[0]]=="X"
    return "X"
  end
  if board[won?(board)[0]]=="O"
    return "O"
  end
end

def full?(board)
  !board.any? { |x| x == " " }
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
