board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

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

def input_to_index(input)
  s = input.to_i
  s - 1
end

def move(board, index, char)
  board[index] = char
  display_board(board)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board, index)
    move(board, index, current_player(board) )
  else
    puts "Sorry, that was an invalid move."
    turn(board)
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
  if  turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  combo = 0
  while combo < WIN_COMBINATIONS.length
    current_combo = WIN_COMBINATIONS[combo]
    win1 = current_combo.all? {|position| board[position] == "X"}
    win2 = current_combo.all? {|position| board[position] == "O"}
    if win1 || win2
      return current_combo
    else
    end
    combo += 1
  end
end

def full?(board)
  board.none? {|available| available == " " || nil}
end


def draw?(board)
  full?(board) && won?(board) == nil
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
    until over?(board)
      current_player(board)
      turn(board)
    end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
