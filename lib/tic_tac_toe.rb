# Helper Methods
#require "pry"
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

#  binding.pry

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


#This method takes in an argument of the
#board array and returns the number of turns
#that have been played.
def turn_count(board)
counter = 0
  board.each do |space|
    if "#{space}" == "X" || "#{space}" == "O"
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

 def play(board)

    until over?(board)
     turn(board)
    end
   if won?(board)
       puts "Congratulations #{winner(board)}!"
     elsif draw?(board)
       puts "Cat's Game!"
     end
  end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #bottom row
  [0,3,6], #left vertical
  [2,5,8], #right vertical
  [0,4,8],#top left diagonal
  [2,4,6],#top right diagonal
  [1,4,7]#middle column
]

def won?(board)

  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

   position_1 == "X" && position_2 == "X" && position_3 =="X" || position_1 == "O" && position_2 == "O" && position_3 =="O"

  end

end


    def full?(board)
     board.all?{|i| i == "X" || i == "O"}
    end


  def draw?(board)
    !won?(board) && full?(board)
  end


def over?(board)
  draw?(board) || won?(board) || full?(board)
end


def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 =="X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 =="O"
      return "O"
    else
      nil
  end
    end

end
