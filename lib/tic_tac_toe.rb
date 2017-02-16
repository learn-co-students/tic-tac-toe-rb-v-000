def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!

def input_to_index(position)
  index = position.to_i - 1
end

def move(board, index, xo)
    board[index] = xo
end

def valid_move?(board, int)
  if (int.between?(0,8)  == false)
    return false
  end

  if (int.between?(0,8)  == true) && (position_taken?(board, int) == true)
    return false
  end

  if (int.between?(0,8) == true) && (position_taken?(board, int) == false)
   return true
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  if (board[index] == 'X') || (board[index] == 'O')
    return true
  end

  if (board[index] == "" || (board[index]) == " ") || (board[index] == nil)
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip

  index = input_to_index(input)

  value = valid_move?(board, index)

  xo = current_player(board)

  move(board, index, xo)
  display_board(board)

  while(value)

      puts "Please enter 1-9"
      input = gets.strip

      index = input_to_index(input)

      value = valid_move?(board, index)

      xo = current_player(board)

      move(board, index, xo)
      display_board(board)
  end
end

def turn_count(board)
  counter = 0

  board.each do |position|
    if (position == 'X' || position == 'O')
      counter += 1
    end
  end

  return counter
end

def current_player(board)
  turns_played = turn_count(board)

  if (turns_played == 0)
    return 'X'
  elsif (turns_played == 1)
    return 'O'
  elsif ((turns_played % 2) == 0)
    return 'X'
  elsif ((turns_played % 2) == 1)
    return 'O'
  end
end

require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X') ||
      (position_1 == 'O' && position_2 == 'O' && position_3 == 'O')
      win = true
      return win_combination
    end
  end
  return false
end

def full?(board)
  count = 0

  board.each do |xo|
    if (xo == '' || xo == ' ')
      count += 1
    end
  end

  if (count > 0)
    return false
  else
    return true
  end
end

def draw?(board)
  if (!(won?(board)) && full?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if(won?(board) || draw?(board))
    return true
  else return false
  end
end

def winner(board)
  if (won?(board))
    win_combo = won?(board)

    if(board[win_combo[0]] == 'X')
      return 'X'
    elsif(board[win_combo[0]] == 'O')
      return 'O'
    else return nil
    end
  end
end

def play(board)
  while (!over?(board))
      turn(board)
  end

  if won?(board)
    #puts "Congratulations " + "#{winner(board)}" + " !"
    if (winner(board) == 'X')
      puts "Congratulations X!"
    elsif (winner(board) == 'O')
      puts "Congratulations O!"
    end
  else #draw?(board)
    puts "Cats Game!"
  end
end
