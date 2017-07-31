board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, position)
  board[position] != " " && board[position] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  # play = "X" || play = "O"
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |i|
    if i == "X" || i == "O"
      turn += 1
    end
  end
  return turn
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)

  WIN_COMBINATIONS.detect do |win_combination|

    board[win_combination[0]] && board[win_combination[1]] &&
    board[win_combination[1]] && board[win_combination[2]] &&
    position_taken?(board, win_combination[0])

    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" &&
      board[win_combination[2]] == "X"
      return win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" &&
      board[win_combination[2]] == "O"
      return win_combination
    else
      false
    end
  end
end

def full?(board)
  if board.detect {|position| position == " " || position == nil}
    false
  else
    true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if win_combination = won?(board)
    return board[win_combination.first]
  end
end

def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
