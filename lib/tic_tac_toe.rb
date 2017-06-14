
WIN_COMBINATIONS =[
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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil # safety measures
      taken = false
    elsif board[index] == "X" || board[index] == "O"
      taken = true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
   return false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  i = gets.strip
  index = input_to_index(i)
  vm = valid_move?(board, index)
  if vm == true
    move(board, index, current_player(board))
  else vm == false
    until vm == true
      display_board(board)
      i = gets.strip
      index = input_to_index(i)
      vm = valid_move?(board, index)
      move(board, index, current_player(board))
    end
  end
end

def turn_count(board)
  count = 0
  board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
  if win.all?{|y| board[y] == "X"}
    return win
    elsif win.all?{|y| board[y] == "O"}
      return win
    end
  end
  return false
end

def full?(board)
  board.none? do |i|
    i == " " || i.nil?
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
 if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if draw?(board) == true
       puts "Cats Game!"
  else won?(board)
     puts "Congratulations #{winner(board)}!"
   end
end
