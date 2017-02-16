WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
                    [0,3,6], [1,4,7], [2,5,8],
                    [0,4,8], [2,4,6]]

def display_board(board)
  separated = "|"
  separating = "-----------"
  puts " #{board[0]} #{separated} #{board[1]} #{separated} #{board[2]} "
  puts separating
  puts " #{board[3]} #{separated} #{board[4]} #{separated} #{board[5]} "
  puts separating
  puts " #{board[6]} #{separated} #{board[7]} #{separated} #{board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] === "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
      return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

def turn_count(board)
  turns = 0
  board.each do |position|
    if position == "X" || position == "O"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
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

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? { |position| board[position] == "X" } ||
       combination.all? { |position| board[position] == "O" }
       return combination
    end
  end
  return nil
end

def full?(board)
  if board.any? { |position| position != "X" && position != "O" }
    return false
  else
    return true
  end
end

def draw?(board)
  !won?(board) && full?(board) ? true : false
end

def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
