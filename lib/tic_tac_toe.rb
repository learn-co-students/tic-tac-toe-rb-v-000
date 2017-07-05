WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i
  index = index - 1
end

def move(board, index, value)
  if (valid_move?(board, index) == true)
    board[index] = value
  end
end

def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      return false
    else
      return true
  end
end

def valid_move?(board, index)
  if index < 0 || index > 8 || (position_taken?(board, index) == true)
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if (valid_move?(board, index) == true)
    value = current_player(board)
    move(board, index, value)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0;
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1;
    end
  end
  return counter
end

def current_player(board)
  even_or_odd = turn_count(board)
  if even_or_odd % 2 == 0
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |set|
    win_index_1 = set[0]
    win_index_2 = set[1]
    win_index_3 = set[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return set
    end
  end
  return false
end

def full?(board)
  board.none? do |space|
    if space != "X" && space != "O"
      return false
    end
  end
end

def draw?(board)
  if full?(board) && (won?(board) == false)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
  set_of_winning_numbers = won?(board)
  if set_of_winning_numbers == false
    return nil
  else
    return board[set_of_winning_numbers[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if over?(board) == true
    if won?(board) != false
      set_of_winning_numbers = won?(board)
      puts "Congratulations " + winner(board) +"!"
    elsif draw?(board) == true
      puts "Cats Game!"
    end
  end
end
