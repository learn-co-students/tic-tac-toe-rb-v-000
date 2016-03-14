WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [0,3,6], #Left Row
  [2,5,8], #Right Row
  [6,7,8], #Bottom Row
  [3,4,5], #Midleft-Midright
  [1,4,7], #Topmid-Botmid
  [0,4,8], #Top-Left-Bottom-Right Diagonal
  [2,4,6] #Top-Right-Bottom-Left Diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, character = "X")
  position = position.to_i-1
  board[position] = character
end

def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
  else
    true
  end
end

def valid_move?(board,position)
  position = position.to_i - 1
  if position.between?(0,8)
    if board[position]== " " || board[position] == ""
        true
    end
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.chomp
  if valid_move?(board,position)
    move(board, position, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |random|
    if random == "X" || random == "O"
      counter +=1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.any? do |wincombos|
    if (board[wincombos[0]] == "X" || board[wincombos[0]] == "O") && board[wincombos[0]] == board[wincombos[1]] && board[wincombos[1]] == board[wincombos[2]]
      return wincombos
    end
  end
end

def full?(board)
  board.all? do |fullness|
    if fullness == "X" || fullness == "O"
      true
    end
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
      puts "Cats Game!"
  end
end
