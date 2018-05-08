WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
    
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(choice)
  choice = choice.to_i - 1
end


def move(array, choice, character)
  array[choice] = character
end


def position_taken? (board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end


def valid_move? (array, index)
  index.between?(0,8) && !(position_taken?(array, index))
end


def turn(board)
  puts "Please enter 1-9:"
  choice = gets.strip
  index = input_to_index(choice)
  
  if valid_move?(board, index)
  move(board, index, current_player(board))
  display_board(board)
else
  turn(board)
  end
end

 
 def turn_count(board)
  counter = 0
  board.each do |space|
   if space != " "
     counter += 1
  end
  end
  counter
end


def current_player(board)
  if turn_count(board).even?
    return "X"
  else 
    return "O"
  end
end

    
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end


def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end


def draw?(board)
  if !won?(board) && full?(board)
     return true
  end
end

  
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end


def winner(board)
  if winner = won?(board)
    return board[winner[0]]
end
end    


def play(board)
  until over?(board)
  turn(board)
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
  end

end