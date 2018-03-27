board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
 puts  " #{board[0]} | #{board[1]} | #{board[2]} "
 puts  "-----------"
 puts  " #{board[3]} | #{board[4]} | #{board[5]} "
 puts  "-----------"
 puts  " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]


def input_to_index(input)
index = input.to_i - 1
end

def move(board, index, character)
  board[index] = character
  display_board(board)
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board,index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  else return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    character = current_player(board)
    move(board, index, character)
  else puts "Sorry, that was an invalid move. Please enter a value from 1-9."
    turn(board)
  end
end


def turn_count(board)
  count = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      count+=1
  end
end
count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(board, combo[0]) && (board[combo[0]] == board[combo[1]]) && (board[combo[0]] == board[combo[2]])
  end
end

def full?(board)
  board.all? do |n|
    n == "X" || n == "O"
  end
end



def draw?(board)
  full?(board) == true && won?(board) == nil
end


def over?(board)
  if full?(board) || won?(board) || draw?(board) || (won?(board) && full?(board))
    true
  else false
  end
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  else nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board) == true
    puts "Cat's Game!"
  elsif
    puts "Congratulations #{winner(board)}!"
  end
end
