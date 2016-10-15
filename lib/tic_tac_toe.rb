WIN_COMBINATIONS = [
 [0,1,2],
 [0,3,6],
 [0,4,8],
 [1,4,7],
 [2,4,6],
 [2,5,8],
 [3,4,5],
 [6,7,8]
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

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
        move(board, index, current_player(board))
    display_board(board)
  else
    puts "Enter the position you would like to play (1-9): "
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |x|
    if x == "X" || x == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
    if turn_count(board) % 2 == 0
    "X"
  else
    "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
  end
      end

      def full?(board)
        board.all? do |pos|
        if pos == "X" || pos == "O"
  true

        end
      end
    end

  def draw?(board)
    !won?(board) && full?(board)
  end

  def over?(board)
    won?(board) || draw?(board) || full?(board)
  end

  def winner(board)
   winning_combo = won?(board)
   if winning_combo
     return board[winning_combo[0]]
   else
    nil
   end
  end

  def play(board)
    until over?(board)
      turn(board)
    end

    if winner(board)
      puts "Congratulations #{winner(board)}!"
    else draw?(board)
      puts "Cats Game!"
    end
  end
