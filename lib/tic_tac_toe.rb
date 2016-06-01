
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Vertical left
  [1, 4, 7], # Vertical middle
  [2, 5, 8], # Vertical right
  [0, 4, 8], # Diagonal left
  [2, 4, 6] # Diagonal right
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, player_token)
  position = position.to_i - 1
  board[position] = player_token
end

def position_taken?(board, position)
  if board[position] == "O" || board[position] == "X"
    true
  elsif board[position] == nil || board[position] == " "
    false
  end
end

def valid_move?(board, position)
  position = position.to_i
  if position.between?(1, 9) && !(position_taken?(board, (position - 1)))
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |turns_taken|
    if turns_taken == "X" || turns_taken == "O"
      turns += 1
    end
  end
  puts turns
  turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board1 = win_combination[0]
    board2 = win_combination[1]
    board3 = win_combination[2]

   board[board1] == board[board2] && board[board2] == board[board3] && board[board2] != " "
  end
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  # index = won?(board).pop
  if won?(board) == nil
    nil
  elsif board[won?(board)[0]] == "X"
    "X"
  elsif board[won?(board)[0]] == "O"
    "O"
  end
end

def play(board)

  until over?(board) == true
    turn(board)

    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cats Game!"
    end

  end
end

# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#
# play(board)
