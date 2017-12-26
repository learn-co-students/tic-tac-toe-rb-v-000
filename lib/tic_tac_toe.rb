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

def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  turns = turn_count(board)
  if turns % 2 == 0
    "X"
  else
    "O"
  end
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
  input = gets.chomp
  index = input_to_index(input)
  validity = false
  while validity == false
    if valid_move?(board, index) == true
      validity = true
    else
      puts "Please enter 1-9:"
      input = gets.chomp
      index = input_to_index(input)
    end
  end
  move(board, index, current_player(board))
  display_board(board)


end

def play(board)
  until over?(board) || draw?(board) do
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    xo = winner(board)
    puts "Congratulations #{xo}!"
  end
end

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

def won?(board)
  results = nil
  WIN_COMBINATIONS.each do |winner|
    if winner.all?{|tester| board[tester] == "X"}
      results = winner
    elsif winner.all?{|tester| board[tester] == "O"}
      results = winner
    end
  end
  return results
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  winning_board = won?(board)
  if winning_board == nil
    return nil
  else
    return board[winning_board[0]]
  end
end
