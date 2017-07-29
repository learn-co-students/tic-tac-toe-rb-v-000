# Define WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #first column
  [1, 4, 7], #second column
  [2, 5, 8], #third column
  [0, 4, 8], #diagonal top left to bottom right
  [2, 4, 6]  #diagonal top right to bot
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Converts user input to index number for array
def input_to_index(user_input)
  user_input.to_i - 1
end

#Places player token on board
def move(board, index, value)
  board[index] = value
end

#Determines if posistion on board is taken
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

#Determine if move is a valid one
def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    true
  end
end

#Logic for a game turn
def turn(board)
  puts "Please enter 1-9:"
  user_input = input_to_index(gets.strip)
  if valid_move?(board, user_input)
    move(board, user_input, current_player(board))
  else
    turn(board)
  end
    display_board(board)
end

#Determine what turn the game is on
def turn_count(board)
  count = 0
  board.each do|i|
    if i != " "
      count += 1
    end
  end
  return count
end

#Determine whos turn it is
def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

#Determine if game has been won
def won?(board)
  WIN_COMBINATIONS.each do |combo_array|
      win_index_1 = combo_array[0]
      win_index_2 = combo_array[1]
      win_index_3 = combo_array[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == position_2 && position_1 == position_3 && position_taken?(board,win_index_1)
        return [win_index_1, win_index_2, win_index_3]
      end
  end
  return false
end


def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) != false
    true
  else
    false
  end
end

def winner(board)
if won?(board) != false
  won?(board).each do|i|
    return board[i]
  end
end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
