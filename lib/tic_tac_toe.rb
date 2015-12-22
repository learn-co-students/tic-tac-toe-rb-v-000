# require 'pry'
###             
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]
# match  positions:  1,2,3   4,5,6   7,8,9   1,4,7   2,5,8   3,6,9   7,5,3   1,5,9
 

def won?(board)
    WIN_COMBINATIONS.detect do |win_combo| 
    win_combo.all? { |obj| board[obj] == "X"} == true || win_combo.all? { |obj| board[obj] == "O"}
  end
end


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def move(board, position, token = "X")
  board[(position.to_i)-1] = token
end


def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end


def valid_move?(board,position)
  true_position = board[(position.to_i)-1]
  if true_position != "X" && true_position != "O" && position.to_i.between?(1,9)
    return true
  else
    return false
  end
end


def turn(board)
    puts "Please enter 1-9:"
    position = gets.strip
      if valid_move?(board,position) == true
        then move(board,position,current_player(board))
          display_board(board)
      elsif  valid_move?(board,position) != true
        loop do
          puts "Sorry, please try a valid entry from 1-9:"
            position = gets.strip
      if valid_move?(board,position) == true
        then move(board,position,current_player(board))
          display_board(board)
        break
      end
    end
  end
end 


def turn_count(board)
  spaces = board.count(" ") 
  return 9 - spaces
end


def current_player(board)
  if turn_count(board) % 2 == 0
    token = "X"
  else turn_count(board) % 2 != 0
    token = "O"
  end
end


def full?(board)
    if board.detect { |i| i == " "} 
      return false
    else board.detect { |i| i == "X"} || board.detect { |i| i == "O"}
      return true
    end
end


def over?(board)
  if draw?(board) == true
      return true
    elsif full?(board) == true
      return true
    elsif full?(board) == false && won?(board) == true
      return false
    elsif won?(board) == true
      return true
    else
  end
end



def play(board)
  while over?(board) == false
        turn(board)
        draw?(board) == true
    end
  if draw?(board) == true
      puts "Cats Game!"
    elsif won?(board) != false
      puts "Congratulations #{winner(board)}!"
    else
  end
end


def draw?(board)
  if full?(board) && won?(board)
      return false 
  
  elsif won?(board) != true && full?(board) == true
    return true      # true for draw

  else won?(board) == true || full?(board) == false
    return false     # false for win or in-progress
  end
end

#####################################################################
#  VARIOUS EXAMPLES FOR 'winner(board) method'
####################################################################
#################  returns X or O, but FAILS NIL ###################
# def winner(board)
#   if won?(board)
#     return board[won?(board)[0]]
#   else
#  end
####################################################################
#################  returns X or O, but FAILS NIL ###################
# def winner(board)
#   if won?(board) != false || won?(board) == true
#     return board[won?(board)[0]]
#   elsif over?(board) == true
#     return board[won?(board)[0]]
#   else
#   end
# end
####################################################################
#################  FAILS X or O, but returns NIL ###################
# def winner(board)
#  if over?(board) == true
#     return board[won?(board)[0]]
#   else
#   end
# end
####################################################################
#################  returns X or O, but FAILS NIL ###################
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
else
 end
end
####################################################################

