board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(array, index, char)
  array[index] = char
end

def position_taken?(array, index)
  if array[index] == "" || array[index] == " " || array[index] == nil
    false
  else
    true
  end
end

def valid_move?(array, index)
  if position_taken?(array, index) == false && index.between?(0, 8)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true && position_taken?(board, index) == false
    move(board, index, current_player(board))
    display_board(board)
  elsif valid_move?(board, index) == false || position_taken?(board, index) == true
    puts "Please enter a valid number, or the number for an unoccupied space"
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |cell_value|
    if cell_value == 'X' || cell_value == 'O'
      counter += 1
      puts "Turn number #{counter}"
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return 'X'
  else
    return 'O'
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_index|
      position_1 = board[win_index[0]]
      position_2 = board[win_index[1]]
      position_3 = board[win_index[2]]

      position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end

def full?(board)
  board.all?{|position| position != " "}
end

def draw?(board)
  if won?(board) != nil ||
    full?(board) == false
    return false
  else
    board.all? do |position|
      position != "X" || "O"
    end
  end
end

def over?(board)
  if won?(board) != nil ||
    draw?(board) == true ||
    full?(board) == true
    return true
  end
end

def winner(board)
  if over?(board) == false || draw?(board) == true
    nil
  elsif over?(board) == true
    win_combo = won?(board)
    char = board[win_combo[0]]
    return char
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board) != nil
    puts "Congratulations #{winner(board)}!"
  end
  if draw?(board) == true
    puts "Cat's Game!"
  end
end
