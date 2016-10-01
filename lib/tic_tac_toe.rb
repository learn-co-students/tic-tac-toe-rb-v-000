WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [6,4,2],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def won?(board)
  outcome = []
  if board.all?{|x| x == " "}
    return false
  end
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|i| board[i] == "X"} || combo.all?{|i| board[i] == "O"}
      combo.each do |n|
        outcome << n
      end
    end
  end
  if outcome.empty?
    return false
  else
    return outcome
  end
end

def full?(board)
  if board.all?{|x| x != " "}
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  elsif draw?(board)
    return true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|i| board[i] == "X"} || combo.all?{|i| board[i] == "O"}
      return board[combo[0]]
    end
  end
  return nil
end

def display_board(board)
  line = "-" * 11
  puts " #{board[0]} | #{board[1]} | #{board[2]} \n#{line}\n #{board[3]} | #{board[4]} | #{board[5]} \n#{line}\n #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn_count(board)
  turns = []
  board.each do |element|
    if element != " "
      turns << element
    end
  end
  occupied = turns.count
  return occupied
end

def current_player(board)
  occupied = turn_count(board)
  if occupied % 2 == 1
    current_player = "O"
    return current_player
  elsif occupied % 2 == 0
    current_player = "X"
    return current_player
  end
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def valid_move?(board, index)
  if index < 0
    return false
  elsif index > 8
    return false
  elsif board[index] != " "
    return false
  else
    return true
  end
end

def move(board, input_to_index, current_player)
  board[input_to_index] = current_player
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  input = input_to_index(input)
  if valid_move?(board, input) == false
    turn(board)
  else
    move(board, input, current_player(board))
    display_board(board)
  end
end

def play(board)
  turns = 0
  while turns < 9
    turn(board)
    turns += 1
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
