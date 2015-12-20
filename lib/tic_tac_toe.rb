require 'pry'
### rspec spec/01_tic_tac_toe_spec.rb
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]
# match  positions:  1,2,3   4,5,6   7,8,9   1,4,7   2,5,8   3,6,9   7,5,3   1,5,9


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#won?

# Your #won? method should accept a board as an argument and return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win. Use your WIN_COMBINATIONS constant in this method.
#                  ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
#determine if there is a winner
#return false if no one won
#return how they won

###    [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]

def won?(board)  
    WIN_COMBINATIONS.detect do |win_combo|
    win_combo.all? { |combo| board[combo]} 
  end
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
        then move(board,position, current_player(board))
          display_board(board)
      elsif  valid_move?(board,position) != true
        loop do
          puts "Sorry, please try a valid entry from 1-9:"
            position = gets.strip
      if valid_move?(board,position) == true
        then move(board,position, current_player(board))
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
    else board.detect { |i| i != " "} && won?(board) == false
      return true
    end
end


def draw?(board)
  if won?(board) == false && full?(board) == true
      return true
    elsif won?(board) == false && full?(board) == false
      return false
    else
  end
end


def over?(board)
  if won?(board) == true
      return true
    elsif draw?(board) == true
      return true
    elsif full?(board) == true
      return true
    else
  end
end
  

# def winner(board)
#   if won?(board) == true
#   board.all? do |token| token 
#     return token
#   end
# end


def winner(board)
  if won?(board) == true
    return board(winner)
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
