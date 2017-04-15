
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, current_player)
   board[index] = current_player
end

def position_taken?(board, index)
   if board[index] == "X" || board[index] == "O"
    true
  else board[index] == " " || "" || nil
    false
  end
end

def valid_move?(board, index)
   if index.between?(0, 8) == true && position_taken?(board,index) == false
return true
else
  return false
 end
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
  count = 0
  board.each do |block|
    if block == "X" || block == "O"
      count += 1
end
end
return count
end

def current_player(board)
turn_count(board).even? ? "X":"O"
end

WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def won?(board)
   WIN_COMBINATIONS.each do |combination|
     if (combination.all? {|index| board[index] == "X"}) || (combination.all? {|index| board[index] == "O"})
       return combination
     end
 end
 false
end

def full?(board)
    if board.all? {|value| value == "X" || value == "O"}
      true
   else
      false
   end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else return nil
  end
end

def play(board)
   while !over?(board)
  turn(board)
end
if won?(board)
  puts"Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cats Game!"
end
end
