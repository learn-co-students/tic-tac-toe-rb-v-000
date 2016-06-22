WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

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

def move(board, index, user)   ##Double checked
  board[index] = user

end

def position_taken?(board, index)
    if board[index] == " "
      false
    elsif board[index] == ""
      false
    elsif board[index] == nil
      false
    else
      true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) &&
     !position_taken?(board, index)
      true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))####
      display_board(board)
    else
      puts "Nope!  Try again!"
     turn(board)
    end
end

def turn_count(board)
  counter = 0
  board.each do |count|
   if count != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])  #If first position ((combo[0])) runs through win combinations and ALSO satisfies position taken, then the board obviously has activity
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winning = won?(board)
    if winning
      board.fetch(winning[0])
    else
      nil
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
