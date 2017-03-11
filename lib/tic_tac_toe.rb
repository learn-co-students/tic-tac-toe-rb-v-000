require 'pry'
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index != " "
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_3 = win_combination[2]
        win_index_2 = win_combination[1]

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

def full?(board)
  if board.all?{|index| index == "X" || index == "O"}
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif full?(board)
    return true
  elsif WIN_COMBINATIONS.any? {|combo| combo == won?(board)}
    return true
  end
end

def winner(board)
  if WIN_COMBINATIONS.any? {|combo| combo == won?(board)}
  winner = won?(board)
  return "#{board[winner[1]]}"
end
end

def play(board)
  until over?(board)
  turn(board)
    if over?(board)
      if won?(board)
        puts "Congratulations #{current_player(board)}!"
      elsif draw?(board)
        puts "Cats Game!"
      end
    else
      current_player(board)
      turn(board)
    end
  end
end
