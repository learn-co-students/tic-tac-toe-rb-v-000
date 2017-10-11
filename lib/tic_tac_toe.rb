require "pry"#

WIN_COMBINATIONS = [
  [0,1,2], # defines a WIN_COMBINATIONS
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)   # defines input_to_index
  input.to_i - 1 # converts user_input to an integer & expect(input_to_index(user_input)).to be_a(Integer)
end

def move(board, position, token)
    board[position] = token
end

def position_taken?(board, position)
  if board[position] != " " && board[position] != ""
    true
    else
      false
  end
end

def valid_move?(board, position)# code your #valid_move? method here
  if position.between?(0, 8)
    if board[position] != "X" && board[position] != "O"
      true
    end
  end
end

def turn(board)
  puts "please makes valid moves"
  input = gets.strip
  position = input_to_index(input)
    if valid_move?(board, position)
      player = current_player(board)
      move(board, position, player)
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  count = 0
    board.each do|position|
      if position == "X" || position == "O"
      count += 1
      end
    end
  count
end


def current_player(board)    # defines current_player
  count = turn_count(board)
  if count.even?
    "X"
  else
    "O"
  end
end

def won?(board)     #defines won?
  WIN_COMBINATIONS.detect do|combo|
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]
    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end

def full?(board)  # defines full?
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)  # draw?
  !won?(board) && full?(board)
end

def over?(board)  #over?
  draw?(board) || won?(board) || full?(board)
end

def winner(board)   # def winner
  if won?(board)
    win_index = won?(board)[0]
    board[win_index]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
   if won?(board)
     puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
    puts "Cat\'s Game!"
  end
end
