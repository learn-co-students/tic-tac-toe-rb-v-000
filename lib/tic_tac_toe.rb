WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
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

def move(board, user_input, char)
  board[user_input] = char
end

def position_taken?(board, index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  else board[index] = "X"
    true
  end
end

def valid_move?(board, index)
    if index.between?(0, 8) && board[index] == " "
      true
    else position_taken?(board, index) == nil && board[index] == "X"
      false
    end
end

def turn(board)
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
    if valid_move?(board, index) == true
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  counter = 0

  board.each do |index|
    if index != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win|

    if win.all? {|y| board[y] == "X"}
      return win
    elsif win.all? {|y| board[y] == "O"}
      return win
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  !(won?(board)) && (full?(board))
end

def over?(board)
  if full?(board) == true
    return true
  else full?(board) == false
    return false
  end
end


def winner(board)
  if (draw?(board)) || !full?(board) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  else (board[won?(board)[0]] == "O")
    return "O"
  end
end

def play(board)
  while !over?(board) && !won?(board) && !draw?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end

  if draw?(board)
    puts "Cats Game!"
  end
end
