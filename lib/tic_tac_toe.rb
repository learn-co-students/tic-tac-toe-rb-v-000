
# Helper Methods / Before Game Start
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

# Helper Methods / Game Start
def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  count = 0
  board.each do |pos|
    if pos != " "
      count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    puts "You Chose Postion #{index + 1}"
    display_board(board)
  else
    turn(board)
  end
end

# Helper Methods / Game End
WIN_COMBINATIONS = [
  [0,1,2], #Top_row [0]
  [3,4,5], #Middle_row [1]
  [6,7,8], #Bottom_row [2]

  [0,3,6], #Left_Column [3]
  [1,4,7], #Middle_Column [4]
  [2,5,8], #Right_Column [5]

  [0,4,8], #Diagonal_0-8 [6]
  [2,4,6]  #Diagonal_2-6 [7]
]

def won?(board)
  WIN_COMBINATIONS.detect { |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  }
end

def full?(board)
  board.all? { |i| i == "X" || i == "O" }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo[0]]
  end
end

#Play Game
def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
