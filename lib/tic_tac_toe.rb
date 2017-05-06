WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def display_board(board)
  print " #{board[0]} |"
  print " #{board[1]} |"
  puts " #{board[2]} "
  puts "-----------"
  print " #{board[3]} |"
  print " #{board[4]} |"
  puts " #{board[5]} "
  puts "-----------"
  print " #{board[6]} |"
  print " #{board[7]} |"
  puts " #{board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def move(board, index, character)
  board[index] = character
  return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index >= 0 && index <= 8 && !(position_taken?(board, index))
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |i|
    if (i == "X" || i == "O")
      count += 1
    end
  end
  return count
end

def current_player(board)
  count = turn_count(board)
  if count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |comb|
    if board[comb[0]] == "X" && board[comb[1]] == "X" && board[comb[2]] == "X"
      return comb
    end
    if board[comb[0]] == "O" && board[comb[1]] == "O" && board[comb[2]] == "O"
      return comb
    end
  end
  return false
end

def full?(board)
  board.each do |index|
    if index != "X" && index != "O"
      return false
    end
  end
  return true
end

def draw?(board)
  if !(won?(board)) && full?(board)
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

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

def play(board)
  while !(over?(board))
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
