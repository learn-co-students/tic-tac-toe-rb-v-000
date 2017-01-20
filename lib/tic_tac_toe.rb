# describe WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left to Right Diagonal
  [6,4,2]  # Right to Left Diagonal
]

# describe display_board method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# describe input_to_index method
def input_to_index(user_input)
  if user_input == "1" || user_input == "2" || user_input == "3" || user_input == "4" || user_input == "5" || user_input == "6" || user_input == "7" || user_input == "8" || user_input == "9"
    user_input.to_i - 1
  else
    -1
  end
end

# describe move method
def move(board, index, token)
  board[index] = token
end

# describe position_taken method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# describe valid_move method
def valid_move?(board, index)
  (index >= 0 && index <=8) && !position_taken?(board, index)
end

# describe turn method
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip

  index = input_to_index(input)

  token = current_player(board)

  if valid_move?(board, index) == true
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

# describe turn_count method
def turn_count(board)
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
      count += 1
    end
  end
  return count
end

# describe current_player method
def current_player(board)
  player = turn_count(board)

  if player % 2 == 0
    "X"
  else
    "O"
  end
end

# describe won? method
def won?(board)
  WIN_COMBINATIONS.detect {|win_index| win_index if board[win_index[0]] == board[win_index[1]] && board[win_index[1]] == board[win_index[2]] && board[win_index[0]] != " "}
end

# describe full? method
def full?(board)
  board.select{|pos| pos == " "} == []
end

# describe draw? method
def draw?(board)
  won?(board) == nil && full?(board)
end

# describe over? method
def over?(board)
  if won?(board) != nil
    true
  else
    draw?(board)
  end
end

# describe winner method
def winner(board)
  if won?(board) != nil
    win_player = won?(board)
    board[win_player[0]]
  else
    nil
  end
end

# describe play method
def play(board)
  while over?(board) != true
    turn(board)
  end

  if over?(board) == true && won?(board) != nil
    puts "Congratulations #{winner(board)}!"
  elsif over?(board) == true && draw?(board) == true
    puts "Cats Game!"
  end
end
