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
  valid = false
  current_player = ""
  if turn_count(board).even?
    current_player = "X"
  else
    current_player = "O"
  end
  until valid == true
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, current_player)
      display_board(board)
      valid = true
    end
  end
end

def turn_count(board)
  count = 0
  board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  moves = turn_count(board)
  if moves.even?
    "X"
  else
    "O"
  end
end

def winner_array(board)
  counter = 0
  xs = []
  os = []
  board.each do |move|
    if move == "X"
      xs << counter
    elsif move == "O"
      os << counter
    end
    counter += 1
  end
  won = false
  winner_arr = []
  WIN_COMBINATIONS.each do | combo |
    won = combo.all? do | i |
      xs.include?(i)
    end
    if won == true
      winner_arr = ["X", combo]
      return winner_arr
      break
    else
      won = combo.all? do | i |
        os.include?(i)
      end
      if won == true
        winner_arr = ["O", combo]
        return winner_arr
        break
      end
    end
  end
  won
end

def won?(board)
  if winner_array(board) == false
    false
  else
    winner_array(board)[1]
  end
end

def full?(board)
  board.all? do | space |
    space == "X" || space == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) != false
end

def winner(board)
  if winner_array(board) == false
    nil
  else
    winner_array(board)[0]
  end
end

def play(board)
  game_over = false
  until over?(board) || game_over do
    turn(board)
    game_over = true
  end
end
