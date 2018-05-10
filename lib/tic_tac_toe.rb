


WIN_COMBINATIONS = [
  [0,1,2],
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



def input_to_index(user_input)
  user_input.to_i - 1
end



def move(board, index, current_player)
  board[index] = current_player
end


def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end



def turn_count(board)
  t_count = 0
  board.each do |cell|
    if cell == "X" || cell == "O"
      t_count += 1
      puts t_count
    end
  end
  return t_count
end 



def current_player(board)
  count = turn_count(board)
  if count.to_f % 2 == 0 
    current_player = "X"
  else
    current_player = "O"
  end
  return current_player
end






def won?(board)
  WIN_COMBINATIONS.each do |combo|
    rw = board[combo[0]],board[combo[1]],board[combo[2]]
    if rw.all?{|cell| cell == "X"}
      puts combo
      return combo
    elsif rw.all?{|cell| cell == "O"}
      puts combo
      return combo
    end
  end
  return false
end



def full?(board)
  return ! (board.any?{|cell| cell == " " })
end



def draw?(board)
  if (won?(board) == false && full?(board) == true)
    puts "Cat\'s Game!"
    return true
  else
    return false
  end
end



def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
  return false
end



def winner(board)
  
  if won?(board)
    xs = board.count("X")
    os = board.count("O")

    if xs > os
      puts "Congratulations X!"
      return "X"
    else
      puts "Congratulations O!"
      return "O"
    end
  end
  return nil
end



def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  ix = input_to_index(input)
  puts ix
  if valid_move?(board, ix)
    puts "valid"
    
    current_player = current_player(board)
    move(board,ix,current_player)
    display_board(board)
  else
    turn(board)
  end
end



def play(board)
  # puts "Welcome to Tic Tac Toe!"
  # display_board(board)

  until over?(board) == true
    puts "not over"
    turn(board)
  end
  puts "over"

  winner(board)
  draw?(board)

end
