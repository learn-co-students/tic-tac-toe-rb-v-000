WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row horizontal
  [6,7,8],  # Bottom row
  [0,3,6],  # Left row vertical
  [1,4,7],  # Middle row vertical
  [2,5,8],  # Right row vertical
  [0,4,8],  # Diagonal Top left
  [2,4,6],  # Middle row vertical
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(position)
  return position.to_i - 1
end

def move(board, index, marker)
  board[index] = marker
  return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0,8) == true && position_taken?(board, index) == false
    return true
  elsif index.between?(0,8) == true && position_taken?(board, index) == true
    return false
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  index = input_to_index(position)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
  return turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |arr|
    board[arr[0]] == board[arr[1]] && board[arr[1]] == board[arr[2]] && position_taken?(board, arr[0])
  end
end

def full?(board)
  if board.any?{ |i| i == " " }
    return false
  else
    return true
  end
end

def draw?(board)
  # binding.pry
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  #binding.pry
  if won?(board)
    won?(board).each do |i|
      if board[i] == "X"
        return "X"
      elsif board[i] == "O"
        return "O"
      else
        return nil
      end
    end
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end

end
