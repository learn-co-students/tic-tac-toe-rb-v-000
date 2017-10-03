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

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) || !(index.between?(0,8))
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  player_move = gets.strip
  valid = input_to_index(player_move)
  if !valid_move?(board, valid)
    turn(board)
  else
    move(board, valid, current_player(board))
    display_board(board)
  end  
end

def turn_count(board)
  index = 0
  count = 0
  while index < 9
    if board[index] == "X" || board[index] == "O"
      count += 1
      index += 1
    else
      index += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def empty?(board)
  board.all? {|x| x == " "}
end

def full?(board)
  !board.include?(" ")
end

def won?(board)
  index = 0
  loop do
    if empty?(board)
      return false
    elsif index > 7
      return false
    elsif board[WIN_COMBINATIONS[index][0]] == "X" && board[WIN_COMBINATIONS[index][1]] == "X" && board[WIN_COMBINATIONS[index][2]] == "X"
      return WIN_COMBINATIONS[index]
    elsif board[WIN_COMBINATIONS[index][0]] == "O" && board[WIN_COMBINATIONS[index][1]] == "O" && board[WIN_COMBINATIONS[index][2]] == "O"
      return WIN_COMBINATIONS[index]
    else
      index += 1
    end
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board).is_a?(Array) || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board).is_a?(Array) && board[won?(board).last] == "X"
    return "X"
  elsif won?(board).is_a?(Array) && board[won?(board).last] == "O"
    return "O"
  else
    return nil
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
