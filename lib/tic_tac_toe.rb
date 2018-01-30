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
#
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

# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index) == true
#     move(board, index, current_player(board))
#     display_board(board)
#   else
#     turn(board)
#   end
# end



def turn_count(board)
  count = 0
  board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
  return count
end


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end


def won?(board)
  if board.none? {|i| i == "X" || i == "O"}
    false
  else
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = win_combination[0]
      position_2 = win_combination[1]
      position_3 = win_combination[2]
      if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X" || board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
        return win_combination
      end
    end
  end
  false
end

def full?(board)
  board.none? {|i| i == " "}
end

def draw?(board)
  if won?(board) != false
    false
  else
    full?(board)
  end
end

def over?(board)
  if full?(board) || won?(board)
    true
  else
    draw?(board)
  end
end


def winner(board)
  combo = won?(board)
  if combo == false
    nil
  elsif combo.all? {|index| board[index] == "X"}
    return "X"
  else combo.all?{|index| board[index] == "O"}
    return "O"
  end
end


def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
