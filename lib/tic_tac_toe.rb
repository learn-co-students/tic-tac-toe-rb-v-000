

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
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
!(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if !valid_move?(board, index)
    turn(board)
  end
  move(board, index, current_player(board))
    display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
    counter += 1
    end
  end
return counter
end

def current_player(board)
  if turn_count(board).odd?
  return "O"
else turn_count(board).even?
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    position_taken?(board, win_combination[1]) && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]]
  end
end

##is the board full = draw: none? checks board for empty spaces/index present in the board.  If none are empty then the board is full
def full?(board)
  board.none? do |index|
    index == " " ||index.nil?
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 else draw?(board)
   puts "Cat's Game!"
 end
end
