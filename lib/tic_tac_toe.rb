WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # first column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # left diagonal
  [2,4,6] # right diagonal
]

def display_board(board)
  separator_row = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts separator_row
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts separator_row
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(board,index,character)
  board[index] = character
end

def position_taken?(board,index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    false
  elsif (board[index] == "X" || board[index] == "O")
    true
  end
end

def valid_move?(board,index)
  if (index.between?(0,8) && !position_taken?(board,index))
    true
  else
    false
  end
end

def turn_count(board)
  counter = 0

  board.each do |space|
    if (space == "X" || space == "O")
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turns = turn_count(board)
  turns.even? ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      win_combination
    else
      false
    end
  end
end

def full?(board)
  positions=[0,1,2,3,4,5,6,7,8]
  checkPositions = positions.select do |index|
    position_taken?(board,index)
  end

  if checkPositions.length == 9
    true
  else
    false
  end
end

def draw?(board)
  # true if board not won and full
  # false if board not won and not full
  # false if board is won
  if (!won?(board) && full?(board))
    true
  elsif (!(won?(board) && full?(board)) || (won?(board)))
    false
  else
  end
end

def over?(board)
  # true if board won
  # true if board draw
  # true if board full
  if (won?(board) || draw?(board) || full?(board))
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

  while !over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat\'s Game!"
  else
  end

end
