
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]
]

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

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  until valid_move?(board, index)
    puts "Please enter 1-9:"
    index = gets.strip
    index = input_to_index(index)
  else
    move(board, index, current_player(board))
    display_board(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do | token |
    if token == "X" || token == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |place|
    board[place[0]] == board[place[1]] &&
    board[place[1]] == board[place[2]] &&
    position_taken?(board, place[0]) #review this line
 end
end

def full?(board)
  board.all? do |token| token == "X" || token == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board) #review this method again
  return nil unless won?(board)
  return "X" if board[won?(board)[0]] == "X"
  return "O" if board[won?(board)[0]] == "O"
end

def play(board)
  num_turn = 0
  until num_turn == 9
    turn(board)
    num_turn += 1
  end
  if won?(board) == true
    puts "Congratulations #{winner(board)}!"
  else
    !won?(board) && full?(board)
    puts "Draw!"
  end
end
