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

def input_to_index(number)
  number.to_i - 1
end

def move(board, position, character)
  board[position] = character
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def  position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
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
  board.each do |move|
    if move == "X" || move == "O"
      count +=1
  end
  end
  count
end

def  current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
 end
end

def won?(board)
  WIN_COMBINATIONS.each do |combinations|
    if board [combinations[0]] == "X" && board[combinations[1]] == "X" && board[combinations[2]] == "X" || board[combinations[0]] == "O" && board[combinations[1]] == "O" && board[combinations[2]] == "O"
      return combinations
    end
  end
  return  false
end

def full?(board)
  board.all? {|combinations| combinations == "X" || combinations == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  else
    return "O"
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
