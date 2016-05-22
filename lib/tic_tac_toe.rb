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
  user_input.to_i - 1
end

def move(board, user_input, value = "X" || "O")
  board[user_input] = value
end

def position_taken?(board, user_input)
  if board[user_input] == " " || board[user_input] == "" || board[user_input] == nil
    false
  elsif board[user_input] == "X" || board[user_input] == "O"
    true
  end
end

def valid_move?(board, user_input)
  !position_taken?(board, user_input) && user_input.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  user_input = input.to_i-1
  if valid_move?(board, user_input)
    move(board, user_input)
    display_board(board)
  else turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |board|
  if board == "X" || board == "O"
  counter += 1
end
end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  elsif turn_count(board).odd?
    "O"
  end
end

def won?(board)

WIN_COMBINATIONS.each do |combination|
  position_1 = board[combination[0]]
  position_2 = board[combination[1]]
  position_3 = board[combination[2]]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return combination
  end
end
false
end

def full?(board)
board.none? {|board_element| board_element == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif won?(board)
    return false
  end
end

def over?(board)
  board.each do |board_element|
    if full?(board) || won?(board) || draw?(board)
      return true
    end
  end
  false
end

def winner(board)
  WIN_COMBINATIONS.each do |combination|
    position_1 = board[combination[0]]
    position_2 = board[combination[1]]
    position_3 = board[combination[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    end
  end
  nil
end


def play(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  else
    counter = 0
    until over?(board) || draw?(board) || full?(board) || won?(board)
      turn(board)
      counter += 1
    end
  end
end
