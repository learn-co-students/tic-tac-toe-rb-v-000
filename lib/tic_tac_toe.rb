WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

#helper Methods
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

def turn_count(board)
  taken_spaces = 0

  board.each do |space|
    if "X" == space || "O" == space
      taken_spaces += 1
    end
  end

  return taken_spaces
end

def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    all_x = win_combination.all? do |index|
      'X' == board[index]
    end
    all_y = win_combination.all? do |index|
      'O' == board[index]
    end
    if all_x or all_y
      return win_combination
    end
  end
  false
end

def full?(board)
  board.all?{ |slot| 'X' == slot or 'O' == slot }
end

def draw?(board)
  (!won?(board) and full?(board)) ? true : false
end

def over?(board)
  (won?(board) or draw?(board)) ? true : false
end

def winner(board)
  (win_combination = won?(board)) ? board[win_combination[0]] : nil
end

#Main game method
def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
