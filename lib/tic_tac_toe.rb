WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
]

def play(board)
   while !over?(board)
      turn(board)
    end
   if winner(board) == "X"
     puts "Congratulations X!"
   elsif winner(board) == "O"
     puts "Congratulations O!"
   elsif draw?(board)
     puts "Cat\'s Game!"
  end
end


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  if index.between?(0,8)  &&  !position_taken?(board, index)
    true
  else
    taken = false
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_1 = board[win_combo[0]]
    index_2 = board[win_combo[1]]
    index_3 = board[win_combo[2]]

    if index_1 == "X" && index_2 == "X" && index_3 =="X"
      return win_combo
    elsif index_1 == "O" && index_2 == "O" && index_3 =="O"
      return win_combo
    end
  end
  false
end

def full?(board)
  board.all? do |index|
  index == "X" || index == "O"
 end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
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

def position_taken?(board, index)
  if board[index] == " "  ||  board[index] == "" || board[index] == nil
    taken = false
  else
    taken = true
  end
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def turn_count(board)

  counter = 0
  board.each do |count|
    if count == "X" || count == "O"
    counter += 1
    end
  end
  counter
end

def move(board, index, current_player)
  board[index] = current_player
end

def winner(board)
  win_combo = won?(board)
  if win_combo == false
    return nil
  elsif board[win_combo[0]] == "X"
    return "X"
  else board[win_combo[0]] == "O"
    return "O"
  end
end
