WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


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
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each {|input|
    if input == "X" || input == "O"
      counter += 1
    end}
    counter
end


def current_player(board)
  counter = turn_count(board)
  if counter % 2 == 0
    "X"
  else
    "O"
  end
end


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
    return false
end


def full?(board)
  board.any? do |x|
    if x == "" || x == " " || x == nil
      return false
    end
  end
  return true
end


def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end


def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end


def winner(board)
  if won?(board) == false
    return nil
  else
    won?(board).each {|x|
      if board[x] == "X"
        return "X"
      elsif board[x] == "O"
        return "O"
      end
    }
  end
end


def play(board)
  while over?(board) == false
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
