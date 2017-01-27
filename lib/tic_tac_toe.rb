# helper methods here   tes with    rspec spec/01_tic_tac_toe_spec.rb

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,3,6],
  [1,4,7],
  [2,5,8],

  [0,4,8],
  [2,4,6],

]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#single complete turn
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
#argument of the board array and returns the number of turns that have been player

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  return counter
end

#argument of the game board and returns whos turn it is
def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

#accept a board as an argument and return false/nil if there is no win combination present in the board and return the winning combination
# indexes as an array if there is a win. Use your WIN_COMBINATIONS constant in this method.
def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    combination.all? { |index| board[index] == 'X' } || combination.all? { |index| board[index] == 'O' }
  end
end

def full?(board)
  board.none? { |square| square.nil? || square == " " }
end

def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  full?(board) || won?(board) || draw?(board)
end


def winner(board)
  winning_combination = won?(board)
  if !winning_combination
    return nil
  end
  first_winning_index = winning_combination[0]
  board[first_winning_index]
end



def play(board)
  until over?(board)
    turn(board)
  end

  if w = winner(board)
    puts "Congratulations #{w}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
