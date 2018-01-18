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

def move (board, index, players_character)
  board[index] = players_character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
  true
  end
end
def valid_move?(board, index)
 !position_taken?(board, index) && index.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

  def won?(board)  WIN_COMBINATIONS.detect do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination
      end
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
     return   win_combination
      end
    end
  else
    false
  end

def full?(board)
  board.all? do |taken|
    taken == "X" || taken == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
if draw?(board) || won?(board) || full?(board)
  return true
  end
end

def winner(board)
  if won?(board) != false
  board[won?(board).first]
elsif !won?(board)
  return nil
  end
end

def turn_count(board)
  counter = 0
  board.each do |turns|
  if turns == "X"
  counter += 1
  elsif turns == "O"
  counter += 1
 else turns == " "
 counter += 0
end
end
counter
end

def current_player(board)
  if (turn_count(board) % 2 == 0) || (turn_count(board) == 0)
    return "X"
  else
    return "O"
end
end


def play(board)
  while !over?(board)
    turn(board)
  end
  if draw?(board)
     puts "Cat's Game!"
  else won?(board)
     puts "Congratulations #{winner(board)}!"
   end
end
