board = [" "," "," "," "," "," "," "," "," ",]

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
  location = input.to_i-1
end

def move(board, location, current_player)
  location = input_to_index(location)
  board[location] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, location)
  location = input_to_index(location)
  location.between?(0,8) && !position_taken?(board, location)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  location = input_to_index(location)
  if valid_move?(board, location)
    move(board, location, current_player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
return counter 
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else 
    return "O"
  end
end

def won?(board)
  empty = board.all? do |position|
    position == " "
  end
  if empty 
    return false
  end
WIN_COMBINATIONS.each do |combo|
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combo
      end
    end
    false
  end

def full?(board)
  board.none?{|position| position == " "}
end

def draw?(board)
  if won?(board) != false
    return false
  elsif board.any?{|position| position == " "}
    return false
  end
  board.none?{|position| position == " "}
  return true
end

def over?(board)
  if won?(board) != false
    return true
  elsif  draw?(board) == true
    return true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return "X"
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return "O"
    end
  end
  false
  if won?(board) != true
    return nil
  end
end

def play(board)
  counter = 0
  while counter < 9 
    turn(board)
    counter += 1
  end
end
