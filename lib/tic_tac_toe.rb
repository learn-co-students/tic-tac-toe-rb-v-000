# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  wincomb = []
  WIN_COMBINATIONS.each do |comb|
    (board[comb[0]] == "X" && board[comb[1]] == "X" && board[comb[2]] == "X") || (board[comb[0]] == "O" && board[comb[1]] == "O" && board[comb[2]] == "O") ?
    wincomb.push(true) : wincomb.push(false)
  end
  if wincomb.include?(true)
    WIN_COMBINATIONS[wincomb.index(true)]
  else
    false
  end
end

def full?(board)
  board.count("X") + board.count("O") == 9 ?
  true : false
end

def draw?(board)
  if won?(board) 
    false
  elsif !full?(board)
    false
  else
    true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    loc = won?(board)[0]
    return board[loc]
  else
    nil
  end
end

def turn_count(board)
  board.count("X") + board.count("O")
end

def current_player(board)
  turn_count(board).even? ?
    "X" : "O"
end

# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player)
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def play(board)
  until over?(board)
    turn(board)
  end

  if winner(board) != nil
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cats Game!"
  end
end



