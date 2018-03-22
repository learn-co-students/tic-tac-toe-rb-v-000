WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
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

def move(board, index, player)
  board[index] = player
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    true
  else
    false
  end
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  board.count {|symbol| symbol == "X" || symbol == "O"}
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_indices|
    winning_index_1 = win_indices[0]
    winning_index_2 = win_indices[1]
    winning_index_3 = win_indices[2]
    win_move_1 = board[winning_index_1]
    win_move_2 = board[winning_index_2]
    win_move_3 = board[winning_index_3]
    if [win_move_1, win_move_2, win_move_3].all? {|i| i == "X"} || [win_move_1, win_move_2, win_move_3].all? {|i| i == "O"}
      return win_indices
    end
  end
  false
end

def full?(board)
  board.none? {|i| i == " " || i == nil}
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_player = won?(board)
    board[winning_player.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
