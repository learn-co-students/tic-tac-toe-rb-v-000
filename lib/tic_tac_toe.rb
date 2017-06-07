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

def input_to_index(input)
  index = input.to_i - 1
end


def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, character = current_player(board))
    display_board(board)
  else
    turn(board)
  end

end

def turn_count(board)
  counter = 0

  board.each do |item|
    if item == "X" || item == "O"
      counter += 1
    end
  end

  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)

  winning_combo = []

  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||  board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      winning_combo += combo
    end
  end

  if winning_combo == []
    false
  else
    winning_combo
  end
end

def full?(board)
  full = true
  if board.any?{|space| space == " "}
    full = false
  end
  full
end

def draw?(board)
  draw = false
  if won?(board) == false && full?(board) == true
    draw = true
  end
  draw
end

def over?(board)
  over = false
  if won?(board) != false
    over = true
  elsif draw?(board) == true
    over = true
  end
  over
end

def winner(board)
  if won?(board).kind_of?(Array)
    win = won?(board)
    board[win[0]]

  else
    nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if over?(board) == true && won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end


end
