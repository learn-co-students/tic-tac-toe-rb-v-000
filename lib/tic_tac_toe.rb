# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    winX = combo.all? do |index|
      board[index] == 'X'
    end
    winO = combo.all? do |index|
      board[index] == 'O'
    end

    if(winO || winX)
      return combo
    end
  end
  return nil
end

def full?(board)
  board.none? do |space|
    space.nil? || space == " "
  end
end

def draw?(board)
  won = won?(board)
  full = full?(board)
  if(!won && full)
    return true
  elsif(!won && !full)
    return false
  elsif(won)
    return false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
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

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  #returns number of turns played on board
  count = 0
  board.each do |space|
    if(space == "X" || space == "O")
      count += 1
    end
  end

  return count
end

def current_player(board)
  #returns player, either X or O

  return turn_count(board).even? ? "X" : "O"
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

def play(board)

  while !over?(board)
    turn(board)
  end

  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
