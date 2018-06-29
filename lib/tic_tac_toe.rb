WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

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

def move(board, index, value)
  puts board[index] = value
end

def position_taken?(board, index)
   if board[index] == " " || board[index] == "" || board[index] == nil
     false
   else board[index] == "X" || "O"
     true
   end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
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
    move(board, index, current_player(board))
    display_board(board)
  else turn(board)
   end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      puts "#{counter}"
    end
  end
  counter
  end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |numbers|
    board[numbers[0]] == board[numbers[1]] && board[numbers[1]] == board[numbers[2]] && position_taken?(board, numbers[0])
  end
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
   true
 end
end

def winner(board)
  if won?(board)
    array = won?(board)
    index = array[0]
    board[index]
  end
end

def play(board)
  until over?(board)
    turn(board)
    won?(board)
    if won?(board)
       winner = winner(board)
       prints "Congrats #{winner}"
    elsif draw?(board)
    prints "Cat's Game!"
    end
  end
end
