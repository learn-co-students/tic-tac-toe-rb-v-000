WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

SYMBOLS = %W(X O)

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

def move(board, index, symbol)
  board[index] = symbol
end

def position_taken?(board, index)
  SYMBOLS.include?(board[index])
end

def valid_move?(board, index)
  board[index] == " " && index >= 0
end

def turn(board)
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    input = gets.strip
    index = input_to_index(input)
    valid_move?(board, index)
  end
end

def turn_count(board)
  board.count { |symbol| symbol != " " }
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.any? do |combo|
    combo.all? do |index|
      symbol = board[combo[0]]
      board[index] == symbol && symbol != " "
    end
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    win_combo = WIN_COMBINATIONS.find do |combo|
                  combo.all? do |index|
                      symbol = board[combo[0]]
                      board[index] == symbol && symbol != " "
                  end
                end
    board[win_combo[0]]
  end
end

def play(board)
  until over?(board)
    display_board(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
