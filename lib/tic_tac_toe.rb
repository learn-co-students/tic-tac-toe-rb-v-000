def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i
  user_input = user_input - 1
end

def move(array,index,token)
  array[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0,8) && !(position_taken?(board, index))
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |position|
    if position == 'X'
    turns += 1
    elsif position == 'O'
    turns += 1
    end
  end
  return turns
end

def current_player(board)
  if turn_count(board).even?
    'X'
  else
    'O'
  end
end

WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Diagonal Top Left
  [2,4,6]  # Diagonal Top Right
]

def won?(board)
  WIN_COMBINATIONS.any? {|combo|
        if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
          return combo
        elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
          return combo
        end
}
end

def full?(board)
  board.all? do |elements|
    elements == "O" || elements == 'X'
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    TRUE
  else
    FALSE
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    TRUE
  else
    FALSE
  end
end

def winner(board)
  if won?(board)
  position = won?(board)[0]
  winner = board[position]
  else
  nil
  end
  return winner
end

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
