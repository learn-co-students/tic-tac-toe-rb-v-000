
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input_int = input.to_i
  index = input_int - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if position_taken?(board, index) == true
    return false
  elsif board.empty? == true && index.between?(0, 8)
    return true
  elsif board.empty? == false && index.between?(0, 8)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)

  if valid_move?(board, index) == true
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
      if space == "X" || space == "O"
        counter +=1
    end
  end
  return counter
end

def current_player(board)
  turns_played = turn_count(board)
  turns_played.even? ? "X" : "O"
end

def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the win_combination indexes that won.
      else
        false
      end
    end
  return false
end

def full?(board)
  board.all? do |position|
    if position == "X" || position == "O"
      true
    else position == " "
      false
    end
  end
end

def draw?(board)
  full_board = full?(board)
  if !won?(board) && full_board
    true
  elsif !won?(board) && !full_board
    false
  else won?(board)
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
  winning_combination = won?(board)

  if won?(board)
    winning_index = winning_combination[0]
    winning_token = board[winning_index]
    return winning_token
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end

end
