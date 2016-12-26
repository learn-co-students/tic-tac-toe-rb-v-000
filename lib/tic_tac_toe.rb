WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,4,6],
  [0,4,8],
  [2,5,8],
  [1,4,7],
  [0,3,6]
]

def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

def input_to_index(num)
  position = (num.to_i) - 1
  return position
end

def move (board, position, char)
  board[position] = char
  return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    return true
  else
    return false
  end
end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player(board)

    if valid_move?(board, index)
      move(board, index, char)
      display_board(board)
    else
      turn(board)
    end
  end

def turn_count(board)
  filled_positions = board.select{|i| i == "X" || i == "O"}
  return filled_positions.count
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
  if false
    return false
  end
end

def full?(board)
  board.all? {|player| player == "X" || player == "O"}
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  elsif won?(board)
    return false
  else
    return false
  end
end

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  winning_array = won?(board)
  if won?(board)
    return board[winning_array[0]]
  else
    return nil
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
