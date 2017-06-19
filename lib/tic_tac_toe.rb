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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  "#{user_input}".to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
return false if board[index].nil?
  !board[index] == "" || !board[index] == " " || board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    return true
  else
    return false
end
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
  # board = ['', '' , '', "X"]
  counter = 0
  board.each do |position|
    #position == ' ' or 'X' or 'O'
    if position == 'X' || position == 'O'
      counter += 1
    end
  end

  return counter #integer, number of turns
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  # you can't use won?(board) == false, because even though it's a falsey value, the value is nil
  WIN_COMBINATIONS.find{|win_combo| board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && board[win_combo[0]] != " "}
end

def full?(board)
  WIN_COMBINATIONS.all?{|complete| board[complete[0]] == "X" || board[complete[0]] == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    indices = won?(board)
     # indices == [0,1,2]
     index = indices[0]
     # index == 0, one of the winning indexes
     board[index]
     # board[index] will return whatever token is at index 0 on the board, regardless if
 	# it's X or O
   end
 end

 def play(board)
  until over?(board)
    turn(board)
  end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cats Game!"
 end
 end
