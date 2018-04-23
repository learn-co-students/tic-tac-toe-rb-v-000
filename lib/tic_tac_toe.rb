
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
display_board(board)

def input_to_index(input)
  input.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
  end
  move(board, 0, "O")
  move(board, 8, "X")

def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
  elsif board[position] == "X" || board[position] =- "O"
    true
  end
end

def valid_move?(board, index)
 if !position_taken?(board, index) && index.between?(0,8)
    return true
 end
end

def turn(board)
  puts "Please enter 1-9:"
  users_input=gets.strip
  index = input_to_index(users_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.count do |count|
    if count != " "
      counter+=1
    end
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
   "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_combination[0])
    end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
   if full?(board) && !won?(board)
     true
   end
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
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
