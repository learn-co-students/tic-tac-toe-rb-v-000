WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 4, 8],[2, 4, 6],[0, 3, 6],[1, 4, 7], [2, 5, 8]]

@winner = nil
def display_board(board)
  puts "                                            "
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts "                                            "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, token)
  board[position] = token
end

def position_taken?(board, position)
  board[position] == " " ? FALSE : TRUE
end

def valid_move?(board, position)
  if (position < 0) || (position > 8) || position_taken?(board, position) == TRUE
    return FALSE
  else
    return TRUE
  end
end

def turn(board)
  position = gets.chomp
  position = input_to_index(position)
  if valid_move?(board, position)
    move(board, position, token=current_player(board))
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |cell|
    if (cell == "X") || (cell == "O")
      count +=1
    end
  end
  return count
end

def current_player(board)
  turn_count(board)%2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
      @winner = board[combo[0]]
    end
  end
  if @winner != nil
    return true
  else
    return false
  end
end

def full?(board)
  turn_count(board) < 9 ? false : true 
end

def draw?(board)
  if won?(board) || full?(board) == false
    false
  else
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  won?(board)
  @winner
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
end