WIN_COMBINATIONS = [  # win combinations
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # left c
  [1,4,7], # middle c
  [2,5,8], # right c
  [0,4,8], # diag lr
  [2,4,6]  # diag rl
]

def display_board(board)    #displays board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)    #converts user input to index value
  user_input.to_i - 1
end

def move(board, index, current_player)    # makes the move
  board[index] = current_player
end

def position_taken?(board, location)        #tests for empty board space
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)       # tests move validity
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)     # turn input
  puts "It is now #{current_player(board)}'s turn.'"
  puts "Please enter your move (1-9):"
  input = gets.strip
  index = input_to_index(input)
  current_player = current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)   # returns turns played
  counter = 0
  board.each do |space|
    if space == "X"
      counter += 1
    elsif space == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)   # uses turn_count to determine current player
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)   # do we have a winner?
  WIN_COMBINATIONS.each do |win_checker|
    win_index_1 = win_checker[0]
    win_index_2 = win_checker[1]
    win_index_3 = win_checker[2]
    cross_check = [board[win_index_1], board[win_index_2], board[win_index_3]]

    if cross_check.all? do |check| # check x win
      check == "X"
    end
    return win_checker


    elsif cross_check.all? do |check| # check O win
      check == "O"
    end
    return win_checker

    elsif board.none? do |check| # check empty board
      (check == "X" || check == "O")
    end
    return false

    end
end
  return false
end

def full?(board)  # checks if board is full
  board.all? do |check|
    (check == "X" || check == "O")
  end
end

def draw?(board)    # checks for a draw
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)    # is the game over?
  if won?(board).class == Array || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)   # returns the winner
  if over?(board) == true && draw?(board) == false
    winning = won?(board)
    victor = board[winning[0]]
    puts "#{victor} is the winner!"
    return victor
  end
end

def play(board)   # play the game
  until over?(board) || draw?(board) || won?(board)
    puts "#{turn_count(board)} turns have been played."
    turn(board)
  end

  if won?(board).class == Array # report winner
    puts "Congratulations #{board[won?(board)[0]]}!"
  elsif draw?(board) == true    # report draw
    puts "Cats Game!"
  end
end
