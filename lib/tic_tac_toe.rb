WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board,position,character = "X")
  board[position.to_i - 1] = character
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " " || board[location] == "")
end

def valid_move?(board, position)
   if position.to_i.between?(1,9)
     if !position_taken?(board, position.to_i-1)
       true
     end
   end

  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
    if valid_move?(board,input) && !draw?(board)
       move(board,input,current_player(board))
    else
      turn(board)
    end
    display_board(board)
end

def turn_count(board)
   board.count do |token|
     token == "X" || token == "O"
   end
  count = 0
  board.each do |token|
    if token == "X" || token == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0
     "X"
    else
     "O"
  end
end

def won?(board)
WIN_COMBINATIONS.detect do |winning_combination|
    board[winning_combination[0]] == board[winning_combination[1]] &&
    board[winning_combination[1]] == board[winning_combination[2]] &&
    position_taken?(board, winning_combination[0])
  end
end

def full?(board)
  board.all? do |full_slot|
    full_slot == "X" || full_slot == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board)
     turn(board)
  end

  if draw?(board)
    puts "Cats Game!"

  elsif won?(board)
    puts "Congratulations #{winner(board)}!"

  end
end



