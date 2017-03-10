board=[" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
display_board(board)

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #left diagonal
  [2,4,6], #right diagonal
]

def input_to_index (input)
  input.to_i - 1
end

def move (board, input, char)
  board[input] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (index.between?(0,8)) && !(position_taken?(board, index))
    return true
  elsif (index.between?(0,8) == false) || position_taken?(board, index)
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, char=current_player(board))
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  board.count {|index| index == "X" || index == "O"}
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] && position_taken?(board,win_combo[0])
  end
end

def full?(board)
  WIN_COMBINATIONS.all? do |win_combo|
    position_taken?(board, win_combo[0])
  end
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
    if draw?(board)
      puts "Cats Game!"
    else won?(board)
      puts "Congratulations #{winner(board)}!"
  end
end
