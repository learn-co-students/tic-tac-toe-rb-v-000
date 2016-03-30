# Helper Method

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end



# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
[0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal
[0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical
[0, 4, 8], [2, 4, 6] #Diagonal
]

def won?(board)
  if board_empty?(board)
    return false
  end
  WIN_COMBINATIONS.each do |combo|
    combo_chars = [board[combo[0]], board[combo[1]], board[combo[2]]]
    if combo_chars.all? {|char| char=="X"} || combo_chars.all? {|char| char == "O"}
      return combo
    end
  end
  return false
end


def board_not_full?(board)
  not_full = !board.any? do |pos|
    pos == " "
  end
  return false
end


def full?(board)
  board.none?{|i| i == " " }
end


def draw?(board)
  if full?(board) == true and won?(board) == false
    return true
  end
end


def over?(board)
  draw?(board) == true or won?(board) != false
end


def winner(board)
  if won?(board) == false
    return nil
  end
  WIN_COMBINATIONS.each do |combo|
    combo_chars = [board[combo[0]], board[combo[1]], board[combo[2]]]
    if combo_chars.all? {|char| char=="X" }
      return "X"
    end
    if combo_chars.all? {|char| char == "O" }
      return "O"
    end
  end
end

def turn(board)
  puts "Please enter 1-9:"
  posit=gets
  char = current_player(board)
  if valid_move?(board, posit) == true
    move(board, posit, char)
  elsif valid_move?(board, posit) == false
      puts "Please enter 1-9:"
      posit=gets
  end
display_board(board)
end


def move(board, posit, char = "X")
  board[posit.to_i - 1] = char
end

def turn_count(board)
  count = 0
  board.count do |turns|
    if turns != " "
      count += 1
    end
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 == 1
    return "O"
  end
end

def board_empty?(board)
  empty = !board.any? do |pos|
    pos == "X" || pos == "O"
  end
  return empty
end

def position_taken?(board, char)
  if board[char] == "X" or board[char] == "O"
    return true
  elsif board[char] == " "
    return false
  end
end

def valid_move?(board, posit)
  posit = posit.to_i
  posit = posit - 1
  if posit.between?(0,8) && (position_taken?(board, posit)) == false
    return true
  else
    return false
  end
end


def play(board)
  while over?(board) != true
    turn(board)
  end
  if draw?(board) == true
    puts "Cats Game!"
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  end
end


