WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
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

def move(board, index, player = "X")
  board[index] = player
end

def position_taken?(board, index)
   if board[index] == "" || board[index] == " " || board[index] == nil
    false
   else board[index] =="X" || board[index] =="O"
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else turn(board)
end
end

def turn_count(board)
  turn = 0 
  board.count do |count| 
    if count == 'X' || count == 'O'
    turn += 1 
  end
end
end

def current_player(board)
  if turn_count(board) % 2 == 0  
    "X"
  else turn_count(board) % 2 == 1 
    "O"
  end
end
  
def won?(board)
    WIN_COMBINATIONS.each do |win_move|
      if board[win_move[0]] == "X" && board[win_move[1]] == "X" && board[win_move[2]]== "X"
        return win_move
      elsif board[win_move[0]] == "O" && board[win_move[1]] == "O" && board[win_move[2]] == "O"
        return win_move
      end
   end
   return false 
end

  def full?(board)
     board.all?{|token| token == "X" || token == "O"}
  end
  
  def draw?(board)
    full?(board) && !won?(board)
  end
  
  def over?(board)
    full?(board) || won?(board)
  end
  
  def winner(board)
    if winning_move = won?(board)
      board[winning_move.first]
    end
  end
  
def play(board)
  counter = 0 
  loop do
    counter += 1 
    turn(board)
    if counter >= 9 
      break
    end
  end
end
