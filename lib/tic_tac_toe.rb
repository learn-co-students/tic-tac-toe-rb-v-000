WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2],
]

def display_board (board)
  lineOne = " #{board[0]} | #{board[1]} | #{board[2]} "
  lineTwo = "-----------"
  lineThree = " #{board[3]} | #{board[4]} | #{board[5]} "
  lineFour = " #{board[6]} | #{board[7]} | #{board[8]} "
  puts lineOne
  puts lineTwo
  puts lineThree
  puts lineTwo
  puts lineFour
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
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  turns_taken = 0
  board.each do |occupied_position|
    if occupied_position == "X" || occupied_position == "O"
      turns_taken +=1
    end
  end
  turns_taken
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
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

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  space = " "
  if board.include?(space)
    return false
  else
    return true
  end
end

def draw?(board)
if won?(board) == false && full?(board) == true
  return true
else
  return false
end
end

def over?(board)
if won?(board) != false || draw?(board) == true || full?(board) == true
  return true
else
  return false
end
end

def winner(board)
  if win = won?(board)
    board[win.first]
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
