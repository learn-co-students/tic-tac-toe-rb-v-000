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

def turn(board, player = "X")
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)

  until over?(board)
    player = current_player(board)
    turn(board, player)
  end

  player_won = winner(board)
  if player_won
    puts "Congratulations #{player_won}!"
  else
    puts "Cats Game!"
  end

end

def turn_count(board)
  counter = 0
  board.each {|space|
    if space == "X" || space == "O"
      counter += 1
    end
    }
    return counter

end

def current_player(board)
  counter = turn_count(board)
  turn = counter % 2 == 0 ? "X" : "O"
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
    someone_won = WIN_COMBINATIONS.any? { |combination|
  combination.all? { |i| board[i] == "X" } || combination.all?{ |i| board[i] == "O"}
  }

  if someone_won
    how_they_won = WIN_COMBINATIONS.each {|combination|
      if combination.all? { |i| board[i] == "X" } || combination.all?{ |i| board[i] == "O"}
        return combination
      end
    }
  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winning_combination = won?(board)
  if winning_combination
    return board[winning_combination[0]]
  end
end
