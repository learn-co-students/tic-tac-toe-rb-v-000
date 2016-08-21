WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
[0,3,6], [1,4,7], [2,5,8],
[2,4,6], [0,4,8]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
board = [" "," "," "," "," "," "," "," "," "]


def input_to_index(input)
  input.to_i - 1
end

def move(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  if board[index] ==  " " || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index >= 0 && index <= 8 && board[index] ==  " "
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |player|
    if player == "X" || player == "O"
      counter +=1
    end
  end
  counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    index1 = combo[0]
    index2 = combo[1]
    index3 = combo[2]
    token1 = board[index1]
    token2 = board[index2]
    token3 = board[index3]
      if token1 == "X" && token2 == "X" && token3 == "X"
        return combo
      elsif token1 == "O" && token2 == "O" && token3 == "O"
        return combo
      end
  end
  false
end


def full?(board)
  board.all? do |position|
    position != " "
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
    index1 = combo[0]
    index2 = combo[1]
    index3 = combo[2]
    token1 = board[index1]
    token2 = board[index2]
    token3 = board[index3]
    if won?(board) == combo && token1 == "X"
      return token1
    elsif won?(board) == combo && token1 == "O"
      return token1
    else
    end
  end
  nil
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
