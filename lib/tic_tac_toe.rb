WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def display_board(move)
  puts " #{move[0]} | #{move[1]} | #{move[2]} "
  puts "-----------"
  puts " #{move[3]} | #{move[4]} | #{move[5]} "
  puts "-----------"
  puts " #{move[6]} | #{move[7]} | #{move[8]} "
end

def input_to_index(user_input)
  number = user_input.to_i
  result = 0
  if number.is_a? Integer
    result = number - 1
  else
    result = -1
  end
  return result
end

def move(board, location, character)

  position = location
  board[position] = character

  return display_board(board)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, position)
  location = position.to_i
  if position_taken?(board, location)
    false
  elsif location < 0 || location > 8
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = input_to_index(gets)
  if valid_move?(board, position)
    move(board, position, current_player(board))
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space != nil && space != " " && space != ""
      count += 1
    else
      count += 0
    end
  end
  return count
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  # Flag / Switch
  the_answer = false
  WIN_COMBINATIONS.each do |win_combination| # Scope Gate
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    # implementation
    # x_win = [position_1, position_2, position_3].all? do |position|
    #   position == "X"
    # end
    # o_win = [position_1, position_2, position_3].all? do |position|
    #   position == "O"
    # end
    a_win = [position_1, position_2, position_3].uniq.size == 1 && position_1 != " "
    # return value
    if a_win
      the_answer = win_combination
    end
  end
  the_answer
end

def full?(board)
  full_board = board.all? do |space|
    space == "X" || space == "O"
  end
  return full_board
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
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
  winning_arr = won?(board)
  if winning_arr.class == Array && board[winning_arr[0]] == "X"
    return "X"
  elsif winning_arr.class == Array && board[winning_arr[0]] == "O"
    return "O"
  else
    return nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
