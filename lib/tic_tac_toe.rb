
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]
board = [" ", " ", " ", " ", " ", " ", " ", " "," "]

#This method determines if there is a winner.
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
    end
  end
false
end

#This displays current status of the game.
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#This accepts the user's input and converts it into an index.
def input_to_index(user_input)
  user_input.to_i - 1
end

#This method places the token on the board.
def move(board, index, char)
  board[index] = char
end

move(board,0,"X")

#This method checks if the position is taken
def position_taken?(board, index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

#This method checks if the play is a valid move.
def valid_move?(board, index)
  if index.between?(0, 8) == true && position_taken?(board, index) == false
    true
  else
    false
  end
end

#Keeps count of turns.
def turn_count(board)
  count = 0
  board.each do |token|
    if token == "X" || token == "O"
       count += 1
    end
  end
  return count
end

#Accepts the move from the user.
def turn(board)
    puts "Please enter 1-9:"
      user_input = gets.chomp
      index = input_to_index(user_input)
      turn_count(board)
        if valid_move?(board, index) && turn_count(board).even?
          move(board, index, char = "X")
        elsif valid_move?(board, index) && turn_count(board).odd?
          move(board, index, char = "O")
        else
          turn(board)
        end
end

#Displays current player
def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

#Checks if the board is full.
def full?(board)
  board.all? {|token| token == "O" || token == "X"}
end

#Checks if there is a draw.
def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  elsif won?(board) == true
    false
  end
end


def over?(board)
  full?(board) || won?(board) || draw?(board)
end


def winner(board)
  if won?(board)
    token_1 = won?(board)[0]
    token_2 = won?(board)[1]
    token_3 = won?(board)[2]

    if (board[token_1] == "X" && board[token_2] == "X" && board[token_3] == "X")
      return "X"
    elsif (board[token_1] == "O" && board[token_2] == "O" && board[token_3] == "O")
      return "O"
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
  elsif draw?(board)
    puts "Cats Game!"
  end
end
