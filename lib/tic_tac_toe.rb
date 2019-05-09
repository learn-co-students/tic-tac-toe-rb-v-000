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
  input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  board[index] != " " ? true : false
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  number_of_turns = 0
  board.each do |token|
    if token === "X" || token === "O"
      number_of_turns += 1
    end
  end
  number_of_turns
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
  end
end

def full?(board)
  board.all? {|letter| letter != " " }
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  full?(board) || won?(board) || draw?(board)? true : false
end

def winner(board)
  status = won?(board)
  status.nil? ? nil : board[status[0]]
end


def play(board)
  player_turn = 0
  while player_turn < 9 && !over?(board)
    turn(board)
    player_turn += 1
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
