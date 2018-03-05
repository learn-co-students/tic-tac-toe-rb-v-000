require "pry"

WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal downward right
  [2,4,6] #Diagonal downward left
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
  current_player(board)
  current_player = current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
 board.each do |position|
   if position == "X" || position == "O"
     #or is a hard stop in ruby not this position == ("X" || "O") but this ^
     #because ruby reads ("X" || "O") as (true || false)
     counter += 1
   else
   end
 end
  return counter
end

def current_player(board)
  counter = turn_count(board)
  if counter % 2 == 0
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
end

def won?(board)

#  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#    false
#  elsif

    WIN_COMBINATIONS.each do |combination|
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      position_1 = board[index1]
      position_2 = board[index2]
      position_3 = board[index3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combination
      end
    end
    false
#because return stops the loop and returns for the WHOLE method
#You have to look at ALL the combinations
end
# win_combination is a 3 element array of indexes that compose a win, [A,B,C]
#changed game status instructions array pseudocode from [0,1,2] to [A,B,C]

    #  combination.each do |index|

#original sloppy code
=begin
    WIN_COMBINATIONS.each do |combination|
      if board[0] == "X" && board[1] == "X" && board[2] == "X"
        return WIN_COMBINATIONS[0]
      elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
        return WIN_COMBINATIONS[0]
      elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
        return WIN_COMBINATIONS[1]
      elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
        return WIN_COMBINATIONS[1]
      elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
        return WIN_COMBINATIONS[2]
      elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
        return WIN_COMBINATIONS[2]
      elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
        return WIN_COMBINATIONS[3]
      elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
        return WIN_COMBINATIONS[3]
      elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
        return WIN_COMBINATIONS[4]
      elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
        return WIN_COMBINATIONS[4]
      elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
        return WIN_COMBINATIONS[5]
      elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
        return WIN_COMBINATIONS[5]
      elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
        return WIN_COMBINATIONS[6]
      elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
        return WIN_COMBINATIONS[6]
      elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
        return WIN_COMBINATIONS[7]
      elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
        return WIN_COMBINATIONS[7]
      else
        return false
      end
=end
#    end
#  else
#    false
#  end


def full?(board)
# no need to call won?(board)
    if board[0] == " "
      false
    elsif board[1] == " "
      false
    elsif board[2] == " "
      false
    elsif board[3] == " "
      false
    elsif board[4] == " "
      false
    elsif board[5] == " "
      false
    elsif board[6] == " "
      false
    elsif board[7] == " "
      false
    elsif board[8] == " "
      false
#else shouldn't have condition
    else
      true
    end
end


def draw?(board)
  !won?(board) && full?(board)
=begin  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board) && !full?(board)
    return false
#REMEMBER TO MAKE FINAL ELSE NOT ELSIF
  else won?(board) && full?(board)
    return false
  end
=end
 end

def over?(board)
  won?(board)
  draw?(board)
  full?(board)

  if draw?(board)
    return true
  elsif won?(board) && full?(board)
    return true
  elsif won?(board) && !full?(board)
    return true
  else
    return false
  end
end

def winner(board)
   won?(board)
   if won?(board)
#  EX; return WIN_COMBINATIONS[0] = [0,1,2]
    (won?(board)).each do |position|
#  ([0,1,2]).each do |position|
      board[position]
      if board[position] == "X"
        return "X"
      elsif board[position] == "O"
        return "O"
      end
    end
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
    turn_count(board)
  end
  won?(board)
  if won?(board)
    winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end

end
