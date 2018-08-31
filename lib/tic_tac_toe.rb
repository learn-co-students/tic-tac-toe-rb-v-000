require "pry"
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board(board = ["    ", "    ", "    ", "   ", "   ", "   ", "   ", "   ", "   "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  input = user_input .to_i - 1
end

def move (board, index, token)
  board[index] = token
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
  # token = "X" || "O"
  token = current_player(board)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else
    # binding.pry
    puts "oops! that's not a valid move."
    turn(board)
  end
end

def turn_count(board)
  tokens = ["X", "O"]
  counter = 0
    board.each do |turn|
      tokens.each do |token|
      if turn == token
        counter += 1
      end
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
     "X"
  else
     "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    # binding.pry
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
    end
  end
else
  return false
end

def full?(board)
  board.all? do |positions|
  if  positions == "X" || positions == "O"
     true
  else
     false
  end
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  end
end

def over?(board)
  full?(board) == true || won?(board) || draw?(board) == true
end

def winner(board)
combo = won?(board)
 if combo
   board[combo[0]]
 end
end

# def play(board)
#   until over?(board) == true
#     input = turn(board)
#     if won?(board) == true
#       return "Congratulations player #{board[token]}"
#     elsif draw?(board) == true
#       return "Cat's Game!"
#   end
#   end
# end

def play(board)
  until over?(board) == true
    # binding.pry
    turn(board)

  end
  if won?(board) == true
    return "Congratulations Player #{winner(board)}"
  else
    print "Cat's Game!"
  end
end
