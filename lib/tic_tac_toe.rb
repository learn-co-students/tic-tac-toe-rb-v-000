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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, position)
  !(board[position].nil? || board[position] == " ")
end

def valid_move?(board, position)
  !position_taken?(board, position) && position > -1 && position < 9
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    board[index] = current_player(board)
  else
    turn(board)
  end
  draw?(board)
end

def turn_count(board)
  board.count { |token| token == "X" || token == "O" }
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_array = [board[win_combination[0]], board[win_combination[1]], board[win_combination[2]]]

    if (win_array.all? { | token | token == "X" })
      return "X"
    elsif (win_array.all? { | token | token == "O" })
      return "O"
    end
  end
end

def full?(board)
  board.none? { |token| token == " " || token == "" || token == nil }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board)
end

def play(board)
  #until the game is over
    #take turns
  #end
  until over?(board) do
    turn(board)
  end
  #if the game was won
    #congratulate the winner
  #else if the game was a draw
    #tell the players it has been a draw
  #end

  if won?(board)
    puts "Congratulations #{won?(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end

end
