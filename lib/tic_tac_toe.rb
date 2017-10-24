WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(n)
  return n.to_i - 1
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip()
  if(!move(board, input_to_index(input)))
    turn(board)
  end
  display_board(board)
end

def move(board, index, value)
  if(valid_move?(board, index))
    board[index] = value
    return true
  end
end

def position_taken?(board, index)
  if(board[index] == "X" || board[index] == "O")
    return true
  else
    return false
  end
end

def valid_move?(board, index)
  if((index > -1 && index < 9) && !position_taken?(board, index))
    return true
  end
end

def turn_count(board)
  i = 0
  board.each do |space|
    if(space != " ")
      i += 1
    end
  end
  return i
end

def current_player(board)
  turns = turn_count(board)
  turns % 2 == 0 ? (return "X") : (return "O")
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if(position_taken?(board, combo[0]) && (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]))
      return combo
    end
  end
  return false
end

def full?(board)
  return !(board.include? " ")
end

def draw?(board)
  return (full?(board) && !won?(board))
end

def over?(board)
  return (draw?(board) || won?(board))
end

def winner(board)
  if(over?(board) && won?(board))
    return board[won?(board)[0]]
  end
end

def play(board)
  while(!over?(board)) do
    turn(board)
  end
  if(draw?(board))
   puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
