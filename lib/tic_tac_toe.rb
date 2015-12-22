# require 'pry'
###             
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]
# match  positions:  1,2,3   4,5,6   7,8,9   1,4,7   2,5,8   3,6,9   7,5,3   1,5,9
 

def won?(board)
    WIN_COMBINATIONS.detect do |win_combo| 
    win_combo.all? { |obj| board[obj] == "X"} == true || win_combo.all? { |obj| board[obj] == "O"}
  end
end
#################################################################
# Although ths won? method passes its own tests for true/false, 
# when using it as a helper method elsewhere, there seems to be 
# a difference between (== true) vs (!= false).
#################################################################

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

#####################################################################
#####################################################################
#####################################################################
#          QUESTIONS BELOW

# draw?(board)

# Below are various attempts at '#draw?' and '#winner' methods.
# While the #draw method may pass its own truth test, it seems to fail
# "truthy" tests of the #winner method. 

# winner(board)
# I can get the winner method to show X or O, but cannot get it to also 
# pass the required 'nil' test. 

# won?(board)
# these methods are dependent on the #won?(board) method working right.
# there seems to be a difference between "!= false" vs "== true", especially
# when combined (&&) with other statements like #full?(board).
#


      # Question:   How literal is the rspec test result, when it says that the #won
      # method returned "true" for board submitted by the "#won rspec test"...versus....
      # the board submitted in the "#winner rspec test" or the "#draw? rspec test"?

      # Question:   If refactor my #won? method, will that fix the issue I'm
      # having with #draw and #winner?

#####################################################################
# draw?(board) examples

      # REQUIREMENTS: 
          # returns true for a draw
          # returns false for a won game (FAILED - 1)
          # returns false for an in-progress game

# EXAMPLE 1 ---------fails the "true for draw" test---------------
def draw?(board)
  if full?(board) && won?(board)
      return false 
  
  elsif won?(board) != true && full?(board) == true
    return true      # true for draw

  else won?(board) == true || full?(board) == false
    return false     # false for win or in-progress
  end
end

        # ERROR:
            # returns true for a draw (FAILED - 1)
            # returns false for a won game
            # returns false for an in-progress game

             #  1) ./lib/tic_tac_toe.rb #draw? returns true for a draw
             # Failure/Error: expect(draw?(board)).to be_truthy
             #   expected: truthy value
             #        got: false
             # # ./spec/01_tic_tac_toe_spec.rb:160:in `block (3 levels) in <top (required)>'



# EXAMPLE 2 -----------fails the "false for won game" test ------
# the only change is in the 'if' statement (changed to won?(board) == true)


# def draw?(board)
#   if full?(board) == true && won?(board) == true
#       return false 
  
#   elsif won?(board) != true && full?(board) == true
#     return true      # true for draw

#   else won?(board) == true || full?(board) == false
#     return false     # false for win or in-progress
#   end
# end
       
        # ERROR:
            # returns true for a draw
            # returns false for a won game (FAILED - 1)
            # returns false for an in-progress game

# EXAMPLE 3 ---------fails the "true for draw" test---------------
#           ---------blows up the #over method, too---------------


# def draw?(board)
#     if won?(board) == true
#       return false
#     elsif board[won?(board)[0]] == "X"
#       return false     # attempting to define a "win" explicitly 
#     elsif board[won?(board)[0]] == "O"
#       return false     # attempting to define a "win" explicitly 
#     elsif won?(board) != true && full?(board) == true
#       return true
#     elsif won?(board) != true && full?(board) != true
#       return false
#     else  
#   end
# end

        # ERRORS: 

        # #draw?
        #   returns true for a draw (FAILED - 1)
        #   returns false for a won game
        #   returns false for an in-progress game

        # #over?
        #     returns true for a draw (FAILED - 2)
        #     returns true for a won game
        #     returns false for an in-progress game (FAILED - 3



#####################################################################



#  VARIOUS EXAMPLES FOR 'winner(board) method'
####################################################################
#################  returns X or O, but FAILS NIL ###################
def winner(board)
  if won?(board) != false || won?(board) == true
    return board[won?(board)[0]]
  elsif over?(board) == true
    return board[won?(board)[0]]
 end
end
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
  if won?(board) != false || won?(board) == true
    return board[won?(board)[0]]
  elsif over?(board) == true
    return board[won?(board)[0]]
 end
end
####################################################################

