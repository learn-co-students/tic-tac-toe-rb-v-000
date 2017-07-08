WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    if winner(board) == "X"
    puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(number)
  number = number.to_i
  number - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  if index.between?(0,8) == true && position_taken?(board, index) == false
      true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  number = gets.chomp
  index = input_to_index(number)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even? == true
    "X"
  else
    "O"
  end
end

def won?(board)
  if !(board.include?("X")) && !(board.include?("O"))
    return false
  end
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[0]] != " "
      if board[combo[0]] != nil && board[combo[1]] == board[combo[2]]
         return combo
      end
    end
  end
  false
end

def full?(board)
  if board.include?(" ") || board.include?(nil)
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    winning_array = won?(board)
    if board[winning_array[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    nil
  end
end
