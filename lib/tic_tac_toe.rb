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
  separator = "-----------"
  line_1 = " #{board[0]} | #{board[1]} | #{board[2]} "
  line_2 = " #{board[3]} | #{board[4]} | #{board[5]} "
  line_3 = " #{board[6]} | #{board[7]} | #{board[8]} "

  puts line_1
  puts separator
  puts line_2
  puts separator
  puts line_3
end

def input_to_index(string)
  index = string.to_i - 1
end

def move(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    return false
  elsif (board[index] == "X" || board[index] == "O")
    return true
  end
end

def valid_move?(board, index)
  if (index.between?(0, 8) && position_taken?(board, index) == false)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if (valid_move?(board, index))
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |space|
    if space == "X" || space == "O"
      turn +=1
    end
  end
  return turn
end

def current_player(board)
  if (turn_count(board) % 2 == 0)
     return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win|
    board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] && position_taken?(board,win[0])
  end
end

def full?(board)
  board.all?{|space| space == "X" || space == "O"}
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winning = won?(board)
    board[winning[0]]
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
