# Helper Methods
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    turn_count( board)
    current_player = current_player(board)
    move(board, index, current_player)
    display_board(board)

  else
    turn(board)
  end
end


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

def turn_count( board)
  counter = 0
  board.each do|turn|
    if turn == "X" || turn == "O"
      counter += 1
    else
      counter = counter
    end
  end
  return counter
end

def current_player( board)
  output = turn_count(board)
    if output % 2 == 0
      return "X"
    else
      return "O"
    end
end

WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?( board) #takes in argument of ( board)
  WIN_COMBINATIONS.find do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return win_combination
    else
      false
    end
  end
end

def full?( board)
  board.all?{|positions| positions == "X" || positions == "O"}
end

def draw?( board)
  if (full?( board) && !won?( board)) #|| won?( board)
    #puts "Game Over"

    true
  else won?( board)
    false
  end
end

def winner( board)
  winning_variable = won?(board)
    #puts "#{winning_variable}"
  if winning_variable
    winning_index = winning_variable[0]
    #puts "Game Over"
    puts "Congratulations #{board[winning_index]}!"
    return board[winning_index]
  else
     nil
  end
end

def over?( board)
  full?( board) || draw?( board) || won?( board)
end

# Define your play method below

def play( board)
  until over?(board)
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}"
      #if winner( board)
      #  break
      #else over?( board)
      #  break
      #end
    elsif draw?( board)
      puts "Cats Game!"
    #  break
    #elsif counter >= 9
    #  break
    end
end
