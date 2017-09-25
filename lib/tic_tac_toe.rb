
def play(board)
  if winner(board)
    case winner(board)
    when "X"
      puts "Congratulations X!"
    when "O"
      puts "Congratulations O!"
    end
  elsif draw?(board)
    puts "Cat's Game!"
  end

  until over?(board)
    turn(board)
    if winner(board)
      case winner(board)
      when "X"
        puts "Congratulations X!"
      when "O"
        puts "Congratulations O!"
      end
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
end

def turn_count(board)
  turns = 0
  board.each do |item|
    if item != "" && item != " " && item != nil
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  value = turn_count(board)
  value.even? ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    #turn(board)
  else
    turn(board)
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    return true
  else
    return false
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  user_input = input.to_i
  return user_input - 1
end

def move(array, index, char)
  array[index] = char
  display_board(array)
end

def position_taken?(board, index)
  value = board[index]
  if value == "" || value == " " || value == nil
    return false
  elsif value == "X" || value == "O"
    return true
  end
end

# Helper Method


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagonal
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    pos_1 = board[win[0]]
    pos_2 = board[win[1]]
    pos_3 = board[win[2]]
    # puts win
    #  puts "#{pos_1}, #{pos_2}, #{pos_3}"
    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return win
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return win
    end
  end
  return false
end

def full?(board)
  return board.all? { |item|
    item == "X" || item == "O"
  }
end

def draw?(board)
  if won?(board) != false
    return false
  elsif full?(board)
    return true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    win_i = Array(won?(board))

    if board[win_i[0]] == "X" && board[win_i[1]] == "X" && board[win_i[2]] == "X"
      return "X"
    elsif board[win_i[0]] == "O" && board[win_i[1]] == "O" && board[win_i[2]] == "O"
      return "O"
    else
      return nil
    end
  end
end
