
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],  [0, 3, 6],  [0, 4, 8],
  [3, 4, 5],  [1, 4, 7],  [2, 4, 6],
  [6, 7, 8],  [2, 5, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |index|
    win_index_1 = index[0]
    win_index_2 = index[1]
    win_index_3 = index[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return index
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return index
    end
  end
  false
end

def full?(board)
  outcome = board.all? do |type|
    type == "O" || type == "X"
  end
  if outcome == true
    true
  else
    false
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
  false
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  end
  false
end

def winner(board)
  if won?(board) != false
    index = won?(board)
    index.each do |type|
      if board[type] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  nil
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
      puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space == "X" || space == "O"
      count += 1
    end
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
