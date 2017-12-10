# Helper Method
board = [" "," "," "," "," "," "," "," "," "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def display_board(board)
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your WIN_COMBINATIONS constant

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

def input_to_index(input)
  input = input.to_i
  index = input - 1
  return index
end

def position_taken(board, index)
  if board[index] == " "
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if (index > -1 && index < 9) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

def move(board, index, player)
  board[index] = player
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space != " "
      count += 1
    end
  end
  return count
end

def current_player(board)
  count = turn_count(board)
  if count.odd?
    return "O"
  end
  if count.even?
    return "X"
  end
end


def turn(board)
  valid = false
  while valid == false
    puts"Please enter 1-9:"
    input=gets.strip
    index = input_to_index(input)
    valid = valid_move?(board, index)
  end
  player = current_player(board)
  move(board, index, player)
end

def won?(board)
won = false
winner = nil
empty = true
winning_combo = nil
x_win = false
o_win = false

  WIN_COMBINATIONS.each do |combo|

      x_win = combo.all? do |space|
        board[space] == "X"
      end

      o_win = combo.all? do |space|
        board[space] == "O"
      end
      if x_win || o_win
        winning_combo = combo
      end

  end



empty = WIN_COMBINATIONS.each do |combo|
  combo.each do |space|
    board[space] == " "
  end
end

if winning_combo != nil
  return winning_combo
end
if empty
  return false
end
if winning_combo == nil && !empty
  return false
end

end

def winner(board)
  x_win = false
  o_win = false

  WIN_COMBINATIONS.each do |combo|
    x_win = combo.each do |space|
      board[space] == "X"
    end

    o_win = combo.each do |space|
      board[space] == "O"
    end
  end

  if o_win
    value = "O"
  end
  if x_win
    value = "X"
  end

end

def full?(board)
  full = board.all? do |space|
    space != " "
  end
  return full
end

def over?(board)
  if full?(board) || won?(board)
    return true
  end
end

def draw?(board)
  won = won?(board)
  over = over?(board)
  if !won && over
    return true
  end
end

def winner(board)
  value = won?(board)
  if !value
    return nil
  else
    return board[value[0]]
  end
end

def play(board)
  until won?(board) || over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  end
  if won?(board)
    if winner(board) == "X"
      puts "Congratulations X!"
    end
    if winner(board) == "O"
      puts "Congratulations O!"
    end
  end
end
