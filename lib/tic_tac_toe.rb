WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, char)
  board[position.to_i - 1] = char
end

def position_taken?(board, position)
  position = position.to_i
  if board[position] == "" || board[position] == " " || board[position] == nil
    return false
  elsif board[position] == "X" || board[position] == "O"
    return true
  end
end

def valid_move?(board, position)
  position = position.to_i - 1
  if position >= 0 && position <= 8
    if position_taken?(board, position)
      return false
    else
      return true
    end
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(board, position)
    player = current_player(board)
    move(board, position, player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  index = 0
  count = 0
  while index < board.length do
    if position_taken?(board, index)
      count += 1
    end
    index += 1
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  win_flag = false
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0] #note that win_combination is an array of 3 positions
    win_index_2 = win_combination[1] # and win_index will store the position
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_flag = true
      return win_combination # return the win_combination indexes that won.
    end
  end

  if win_flag == false
    return false
  end

end

def full?(board)
  board.all? {|spot| spot == "X" || spot == "O"}
end

def draw?(board)
  return !won?(board) == true && full?(board) == true
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  winner = won?(board)
  if winner == false
    return nil
  else
    return board[winner[0]]
  end
end

def play(board)
  until over?(board) do
    turn(board)
    if won?(board)
      win_arr = won?(board)
      if win_arr == nil || win_arr == false
        return win_arr
      end
      winner = board[win_arr[0]]
      puts "Congratulations #{winner}!"
      break
    end
    if draw?(board)
      puts "Cats Game!"
      break
    end
  end
end
