WIN_COMBINATIONS = [
[0, 1, 2], #top row
[3, 4, 5], #middle row
[6, 7, 8], # bottom row
[0, 3, 6], #left column
[1, 4, 7], #middle column
[2, 5, 8], #right column
[0, 4, 8], #diag TL - BR
[2, 4, 6]  #diag TR - BL
]

def play(board) 
  # turn_count(board)
  # current_player(board)
  # winner(board)

  until over?(board) do
    turn(board)
  end

  if won?(board)
      puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
      puts "Cats Game!"
  end
end

def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
    if valid_move?(board, input)
      move(board, input, current_player(board))
    else
      turn(board) and return
    end
    display_board(board)
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, current_player ='X')
  board[position.to_i - 1] = current_player
end

def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      # if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || 
      #    (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
      # using this eliminates the need for the 6 lines of code above and 1 below
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  nil
end

def full?(board)
  if board.detect {|space| space == " "} == nil
    true
  end
end

def draw?(board)
  if !full?(board) || won?(board)
    false
  else 
    true
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
  if won?(board)
    return board[won?(board)[0]] #this returns the contents of [won?(board)[0]], not the position. 
  else
    nil
  end
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def position_taken?(board, location)
  board[location] != " "
end

def turn_count(board)
  count = 0
  board.each do |position|
    if position != " "
      count += 1
    end
  end
  count
end

def current_player(board)
  #if turn_count(board) % 2 == 0
  if turn_count(board).even?
    "X"
  else
    "O"  
  end
end




