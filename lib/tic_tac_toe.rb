WIN_COMBINATIONS = [
  [0,1,2],  # top row
  [3,4,5],  # middle row
  [6,7,8],  # bottom row
  [0,3,6],  # left column
  [1,4,7],  # middle column
  [2,5,8],  # right column
  [0,4,8],  # left diagonal
  [2,4,6]   # right diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(position)
  index = position.to_i - 1
  return index
end

def move(board, index, player)
  return board[index] = "#{player}"
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    return nil
  end
end

def turn_count(board)
  turns = 0
  board.each do |player|
    if player == 'X' || player == 'O'
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  turns = turn_count(board)
  turns.even? ? 'X' : 'O'
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  index = input_to_index(position)
  valid = valid_move?(board, index)
  if !valid
    turn(board)
  else
    move(board, index, current_player(board))
    display_board(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    player = board[win_index_1]
    if position_taken?(board, win_index_1)
      win_found = win_combination.all? do |win_index|
        board[win_index] == player
      end

      if win_found
        return win_combination
      end
    end
  end
  return nil
end

def full?(board)
  not_full = board.any? do |player|
    player == nil || player == " "
  end

  return not_full ? false : true
end

def draw?(board)
  return (!won?(board) && full?(board))
end

def over?(board)
  return (won?(board) || draw?(board) || full?(board))
end

def winner(board)
  return won?(board) ? board[won?(board)[0]] : nil
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end

  if draw?(board)
    puts "Cat\'s Game!"
  end
end
