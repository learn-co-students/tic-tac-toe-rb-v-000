WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]
board = [" "," "," "," "," "," "," "," "," "]
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

def move(board,index,token)
  board[index] = "#{token}"
end

def position_taken?(board, position)
  board[position] == "X" || board[position] == "O"
end

def valid_move?(board, position)
  !position_taken?(board, position) &&
  position.between?(0,8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  position = input_to_index(input)

  if valid_move?(board, position)
    move(board,position,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count{|item|item == "X" || item == "O"}
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] &&
    position_taken?(board,combo[0])
  end
end

def full?(board)
  board.all?{|item|item == "X" || item == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board) 
end

  def winner(board)

    if won?(board)
      if board.count("X") > board.count("O")
        "X"
      else
        "O"
      end
    end
  end

  def play(board)
    until over?(board)
      turn(board)
    end

    if winner(board) == "X"
      puts "Congratulations X!"

    elsif winner(board) == "O"
      puts "Congratulations O!"

    else
      puts "Cat's Game!"
    end
  end
