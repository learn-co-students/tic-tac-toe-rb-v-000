

# Define your WIN_COMBINATIONS constant
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
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == "X" &&
      board[win_combination[1]] == "X" &&
      board[win_combination[2]] == "X" ||
      board[win_combination[0]] == "O" &&
      board[win_combination[1]] == "O" &&
      board[win_combination[2]] == "O"
    end
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def turn_count(board)
  counter = 0
  board.each do |spot|
    if spot == "" || spot == " "
    counter += 0
    else
      counter += 1
    end
  end
 counter
end

def current_player(board)
  if turn_count(board).even?
    current_player = "X"
  else
    current_player = "O"
  end
  current_player
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

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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

def winner(board)
  winner = won?(board)
  if won?(board) != nil
    return board[winner[0]]
  end
end

# Define your play method below
def play(board)
  while !won?(board) && !over?(board) do
    turn(board)
    won?(board)
    draw?(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
