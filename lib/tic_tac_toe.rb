WIN_COMBINATIONS= [
  top_row_win=[0,1,2],
  middle_row_win=[3,4,5],
  bottom_row_win=[6,7,8],
  left_column_win=[0,3,6],
  middle_column_win=[1,4,7],
  right_column_win=[2,5,8],
  left_diagonal_win=[0,4,8],
  right_diagonal_win=[2,4,6],
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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  turns=0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
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

def current_player(board)
  turn_count(board) % 2 == 0?"X":"O"
end

def won?(board)
WIN_COMBINATIONS.detect do |i|
  board[i[0]] == board[i[1]] && board[i[0]] == board[i[2]] && position_taken?(board,i[0])
   end
end

def full?(board)
  board.all? do |i|
   i == "X" || i == "O"
  end
end

def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
   full?(board) || won?(board) || draw?(board)
end

def winner(board)
   board[won?(board)[0]] if won?(board)
end


def play(board)
  counter=0
  until over?(board)
    turn(board)
    counter+=1
  end
    if winner(board)
      puts "Congratulations #{winner(board)}!"
    else draw?(board)
      puts "Cat's Game!"
  end
end
