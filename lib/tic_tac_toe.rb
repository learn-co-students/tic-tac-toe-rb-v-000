
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6],
  [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]


def move(board, position, current_player)
  board[position.to_i - 1] = current_player
  true
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(board,position) == true
    move(board, position, current_player(board))
  else turn(board)
  end
  puts display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      counter += 1
    end
  end
      return counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.any? do |combination|
    if (board[combination[0]] == "X" || board[combination[0]] == "O") && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
      return combination
    end
  end
end

def full?(board)
  if board.any?{|spot| spot == " " || spot == nil}
    return false
  else
    true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true
    true
  else
    false
  end
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
  if won?(board) == true
    return "Congratulations " + winner(board) + "!"
  elsif draw?(board)
      puts "Cats Game!"
  end
end

