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

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index = "X")
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) != true && index.between?(0,9)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  char = current_player(board)
  if valid_move?(board, index)
    move(board, index, char)
    display_board(board)
  else
    puts "This is an invalid move!"
    turn(board)
  end
end

def turn_count(board)
  number_of_turns = 0
  board.each do |position|
    if position == "X" || position == "O"
      number_of_turns += 1
    end
  end
  number_of_turns
end

def current_player(board)
  if turn_count(board).odd?
    "O"
  else
    "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    first_spot = board[win_combo[0]]
    second_spot = board[win_combo[1]]
    third_spot = board[win_combo[2]]

    if first_spot == "X" && second_spot == "X" && third_spot == "X"
      return win_combo
    elsif first_spot == "O" && second_spot == "O" && third_spot == "O"
      return win_combo
    end
  end
  return false
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
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
