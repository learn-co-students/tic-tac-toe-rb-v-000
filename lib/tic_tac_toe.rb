#require 'pry'
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
[0,3,6], [1,4,7], [2,5,8],
[0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win_index|
    if board[win_index[0]] == "X" && board[win_index[1]] == "X" && board[win_index[2]] == "X"
      return win_index
    elsif board[win_index[0]] == "O" && board[win_index[1]] == "O" && board[win_index[2]] == "O"
      return win_index
    end
  end
  false
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

def move(board, index, character)
  board[index] = character
  return board[index]

end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  turns
end

def current_player(board)
 turn_count(board).even? ? "X" : "O"
end

def full?(board)
  board.each do |space|
    if space == "X" || space == "O"
    else
      return false
    end
  end
  true
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board).class == Array
    # return board[won?(board)[0]]
    won?(board).each do |winner|
      if board[winner] == "X" || board[winner] == "O"
        return board[winner]
      end
    end
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board)
    require 'pry'
    # binding.pry
    if winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    end
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
