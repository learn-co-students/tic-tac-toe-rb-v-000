def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(n)
  return n.to_i-1
end

def move(array,index, value)
  array[index]=value
end

def valid_move?(board,index)
  if index.between?(0, 8) && ! position_taken?(board,index)
    true
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end
def turn(board)
  condition = false
  until condition
    puts "Please enter 1-9:"
    input=gets.strip
    index=input_to_index(input)
    condition=valid_move?(board,index)
  end
  move(board, index, current_player(board))
  display_board(board)
end
def turn_count(board)
  counter=0
  board.each do |square|
    if square == "" || square == " " || square == nil
      counter
    else
      counter += 1
    end
  end
  return counter
end
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def won?(board)
WIN_COMBINATIONS.detect {|win_combination|
  (board[win_combination[0]]=="X" &&
  board[win_combination[1]]=="X" &&
  board[win_combination[2]]=="X") ||
  (board[win_combination[0]]=="O" &&
  board[win_combination[1]]=="O" &&
  board[win_combination[2]]=="O")
  }

end
def full?(board)
  if board.none? {|i| i==" " || i==""|| i==nil}
    true
  end
end
def draw?(board)
  if full?(board) && ! won?(board)
    true
  end
end
def over?(board)
  if draw?(board) || won?(board)
    true
  end
end
def winner(board)
  if won?(board)
      puts "Congratulations #{board[won?(board)[0]]}!"
      return board[won?(board)[0]]
  elsif over?(board)
    puts "Cat's Game!"
      return nil
  end
end
def play(board)
  until over?(board)
    turn(board)
  end
winner(board)
end
