WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8], 
  [6, 4, 2],
  [1, 4, 7],
  [0, 3, 6],
  [2, 5, 8]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  separator = "-----------"
  puts separator
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts separator
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1 
end

def position_taken?(board, index)
  if 
    board[index] == " " || board[index] == """" || board[index] == nil
    false 
  else
    board[index] == "X" || board[index] == "O"
    true
  end
end

def move(board, index, token)
  board[index] = token 
end

def valid_move?(board, index)
 if index.between?(0, 8) && !position_taken?(board, index) 
   true
 else 
   false 
  end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  return counter
end
  
def current_player(board)
  if turn_count(board).even?
    return "X"
  else 
   return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  moving = current_player(board)
  if valid_move?(board, index)
    move(board, index, moving)
    display_board(board)
  else
    turn(board)
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
    
    if 
      position_1 == "X" && position_2 == "X" && position_3 == "X" || 
      position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
      end
    end
    else 
      false 
    end

def full?(board)
  board.all? do |full_board| 
  full_board == "X" || full_board == "O"
  end
end
  
def draw?(board)
  if
   !won?(board) && full?(board) 
   return true 
  else
   return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else 
    return false
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  over?(board)
    if won?(board)
      winning_token = winner(board)
      puts "Congratulations #{winning_token}!"
    elsif draw?(board)
      puts "Cat's Game!"
  elsif !over?(board)
        turn(board)
        play(board)
  end
end