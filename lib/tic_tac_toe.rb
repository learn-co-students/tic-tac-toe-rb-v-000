WIN_COMBINATIONS =
[[0,1,2], [3,4,5], [6,7,8],
[0,3,6], [1,4,7], [2,5,8],
[0,4,8], [6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(number)
  number = number.to_i
  index = number - 1
  return index
end

def move (board, index, current_player)

  board[index] = current_player
end
def position_taken?(board, index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  elsif board[index] == "X"
    true
  elsif board[index] == "O"
    true

  end
end
def valid_move?(board, index)
  if index.between?(0,8)
    if !(position_taken?(board,index))
      true
    else
      false
    end
  else
    false
  end
end
def turn(board)
  puts "Please enter 1-9:"
  number = gets.strip
  index = input_to_index(number)
  until index.between?(0,8)
    puts "Please enter 1-9"
    number = gets.strip
    index = input_to_index(number)
  end
  valid_move?(board,0)
  move(board, index, current_player(board))
  display_board(board)


end
def current_player(board)
  if turn_count(board).odd?
     "O"
  elsif turn_count(board).even?
     "X"
  end
end

def turn_count(board)
  counter = 0
  board.each do |value|
    if value != " "
      counter +=1
    end
  end
  return counter

end
def won?(board)

  if WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 =="O"
        return win_combination
      end
  end
  else
    false
  end
end

def full?(board)
  board.all? do |i|
    if i == "X" || i == "O"
     true
    else
     false
    end
  end
end

def draw?(board)
   if !(won?(board)) && full?(board)
     true
   else
     false
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
  if won?(board)
    board[won?(board)[0]]
  end
end


def play(board)
  while !(over?(board))
    turn(board)

  end
  winner(board)

  if won?(board)
    puts("Congratulations #{winner(board)}!")
  elsif draw?(board)
    puts("Cats Game!")
  else
    false
  end
end
