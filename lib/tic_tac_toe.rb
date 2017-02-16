WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

def move(board, index, character)
  board[index] = character
  return board
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == nil || board[index] == ""
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false
    if index >= 0 && index <= 8
      return true
    else
      return false
    end
  else
    return false
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
  occupied = 0
  board.each do |position|
    if position != "" && position != " " && position != nil
      occupied +=1
    end
  end
  return occupied
end


def current_player(board)
  x_count = 0
  o_count = 0
  board.each do |position|
    if position == "X"
      x_count += 1
    elsif position == "O"
      o_count += 1
    end
  end
  if x_count == o_count || x_count == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  winning_array = []
  WIN_COMBINATIONS.detect do |win_combinations|
    board[win_combinations[0]] == board[win_combinations[1]] && board[win_combinations[1]] == board[win_combinations[2]] && position_taken?(board, win_combinations[0])
  end
end

def full?(board)
  board.all? {|a| a != " "}
end

def draw?(board)
  full_status = full?(board)
  won_status = won?(board)
  if full_status == true && !won_status
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true or won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    winning_array = won?(board)
    winning_index = winning_array[0]
    if board[winning_index] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end

def play(board)
  display_board(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
