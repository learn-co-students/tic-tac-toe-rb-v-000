WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

board = ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

def move(board, user_input, user_character)
  board[user_input] = user_character
end

def position_taken?(board, index_number)
  if board[index_number] == "X" || board[index_number] == "O"
    true
  elsif board[index_number] == " " || "" || nil
      false
  end
end

def valid_move?(board, index_number)
  if position_taken?(board, index_number) == true
    false
  elsif index_number.between?(0,8) && position_taken?(board, index_number) == false
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index_number = input_to_index(user_input)

  if valid_move?(board, index_number)
    move(board, index_number, user_character = "X")
    display_board(board)
      else turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turns_taken|
    if turns_taken != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) == 15 % 2
    "O"
  else turn_count(board) == 4 % 2
    "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |winning_array|
  if board[winning_array[0]] == "X" && board[winning_array[1]] == "X" && board[winning_array[2]] == "X" || board[winning_array[0]] == "O" && board[winning_array[1]] == "O" && board[winning_array[2]] == "O"
    return winning_array
  end
end
false
end

def full?(board)
  board.all? do |element|
  element == "X" || element == "O"
    end
  end

  def draw?(board)
    if !won?(board) && full?(board)
      true
    end
  end

  def over?(board)
    if draw?(board) || won?(board) || full?(board)
      true
    end
  end

  def winner(board)
    if won?(board)
      board[won?(board)[0]]
    end
  end

  def play(board)
    turn(board)
    over?(board)
    if won?(board)
      puts "Congratulations!"
    elsif draw?(board)
      puts "Cats game!"
  end
end
