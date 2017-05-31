def play(board)
  turn(board) while over?(board) == false
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end
    
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

# def position_taken?(board, location)
#   board[location] != " " && board[location] != ""
# end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |i|
    counter += 1 if i == "X" || i == "O"
  end
  counter
end

def current_player(board)
  count = turn_count(board)
  (count % 2).zero? ? "X" : "O"
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  return false if (0..8).none?{ |i| position_taken?(board, i.to_i) }
  
  WIN_COMBINATIONS.each do |i|
    win_index_1 = i[0].to_i
    win_index_2 = i[1].to_i
    win_index_3 = i[2].to_i
    position_1  = board[win_index_1]
    position_2  = board[win_index_2]
    position_3  = board[win_index_3]

    return i if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
    return i if position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
  end
  false
end

def full?(board)
  board.all? { |i| i == 'X' || i == 'O' }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  return false unless won?(board) || draw?(board) || full?(board)
  true
end

def winner(board)
  winner = won?(board)
  return board[winner[0]] if winner.is_a?(Array)
end

# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#
# puts "Welcome to Tic Tac Toe!"
# play(board)
