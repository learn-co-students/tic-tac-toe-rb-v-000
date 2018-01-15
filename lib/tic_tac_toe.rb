require "pry"
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(user_input)
  user_input.to_i
  user_input = user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, x)
  if board[x] == " "
    return false
  elsif board[x] == ""
    return false
  elsif board[x] == nil
    return false
  elsif x == "X"
    return true
  else x == "O"
    return true
  end
end

def valid_move?(board, x)
  if board[x] == "X"
    return false
  elsif board[x] == "O"
    return false
  elsif x >= 0 && x <= 8
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets
  user_input = input_to_index(user_input)
  if valid_move?(board, user_input)
    token = current_player(board)
    move(board, user_input, token)
    display_board(board)
  else "Please re-enter 1-9:"
    turn(board)
 end
end

def turn_count(board)
  counter = 0
  board.each do |index|
    counter <= 8
  if index == " "
    counter += 0
  elsif index == "X"
    counter += 1
  else
    counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board)%2==0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
  board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
  end
end

def full?(board)
  if board[0] != " " && board[1] != " " && board[2] != " " && board[3] != " " && board[4] != " " && board[5] != " " && board[5] != " " && board[6] != " " && board[7] != " " && board[8] != " "
   true
  else
    false
  end
end

def draw?(board)
  if won?(board) != nil
    false
  elsif full?(board)
    true
  elsif board[0] == " " || board[1] == " " || board[2] == " " || board[3] == " " || board[4] == " " || board[5] == " " || board[6] == " " || board[7] == " " || board[8] == " " ||
    false
  end
end

def over?(board)
      if won?(board)
        true
      elsif draw?(board)
        true
      else
        false
      end
end

def winner(board)
  WIN_COMBINATIONS.detect do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] == "X" && position_taken?(board,combo[0])
      return "X"
    elsif board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] == "O" && position_taken?(board,combo[0])
      return "O"
    end
  end
end

def play(board)
      while over?(board) == false
          turn(board)
      end
      draw?(board)
          if won?(board) == false
            turn(board)
          elsif won?(board) == true
            over?(board)
          elsif won?(board)
            puts "Congratulations #{winner(board)}!"
          elsif draw?(board) == true
            puts "Cat's Game!"
          end
  end
