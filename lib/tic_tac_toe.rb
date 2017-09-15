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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  index
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn(board)
  #puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    puts "invalid move"
    turn(board)
  end
  display_board(board)
end

def move(board, index, current_player)
    board[index] = current_player
end

def valid_move?(board, index)
  if ((position_taken?(board, index)) != (index.between?(0, 8)))
    true
  else ((index.between?(0, 8)) == (position_taken?(board, index)))
    false
  end
end

def won?(board)
  WIN_COMBINATIONS.find { |win_combination| board[win_combination[0]] == board[win_combination[1]] &&  board[win_combination[1]] == board[win_combination[2]] && board[win_combination[0]] != " "}
end

def full?(board)
  board.none? {|token| token == " "}
end

def draw?(board)
  if won?(board)
  else full?(board)
  end
end

def over?(board)
  board.all? {draw?(board) || won?(board)}
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    current_player = "X"
  else turn_count(board).odd?
    current_player = "O"
  end
end

def play(board)
  puts "Please enter 1-9:"
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
    display_board(board)
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
