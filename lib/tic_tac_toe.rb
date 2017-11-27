def play(board)
  until over?(board) || won?(board)
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cat's Game!"
    end
end

WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.find {|win_combination| board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])}
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(board, index, current_player)
    board[index] = current_player
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(board,index)
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
  if position == "X" || position == "O"
    counter +=1 #counter = counter + 1
  end
end 
counter
end

def current_player(board)
  if turn_count(board) == 0 || turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 == 1
    return "O"
  end
end


def full?(board)
  board.all? do |position|
  position == "X" || position =="O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if win_combo = won?(board)
    return board[win_combo[0]]
  end
end
