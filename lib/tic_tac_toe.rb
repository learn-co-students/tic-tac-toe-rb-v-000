WIN_COMBINATIONS =[
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

def turn_count(board)
  count=0
  board.each do |spot|
    if spot=='X' or spot=='O'
      count+=1
    end
  end
  return count
end

def current_player(board)
  turn_count(board)%2==0 ? (return'X') : (return'O')
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (combo.all? {|n| board[n]=='X'}) or (combo.all?{|n| board[n]=='O'})
      return combo
    end
  end
return FALSE
end

def full?(board)
  [0,1,2,3,4,5,6,7,8].all?{|x| position_taken?(board,x)}
end

def draw?(board)
  (!(won?(board)) && full?(board)) ? (return TRUE) : (return FALSE)
end

def over?(board)
  won?(board) || draw?(board)||full?(board) ? (return TRUE) : (return FALSE)
end

def winner(board)
  if winning=won?(board)
    w=board[winning[0]]
    return w
  else
    return nil
  end
end


def play(board)
  while !over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    w=winner(board)
    puts "Congratulations #{w}!"
  end
end

