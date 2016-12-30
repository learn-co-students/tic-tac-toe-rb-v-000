WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

# Helper Methods
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

def move(board, location, current_player)
  board[location] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, location)
  location.between?(0,8) && !position_taken?(board, location)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  location = input.to_i-1
  if valid_move?(board, location)
    move(board, location, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |i|
    if i == "X" || i == "O"
      counter = counter + 1
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
  WIN_COMBINATIONS.detect do |triad|
    (board[triad[0]] == "X" || board[triad[0]] == "O") && 
        board[triad[0]] == board[triad[1]] && board[triad[1]] == board[triad[2]]
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  has_winner = won?(board)
  full?(board) && !has_winner
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end

def play(board)
  until over?(board)
    puts "Your move, #{current_player(board)}"
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

