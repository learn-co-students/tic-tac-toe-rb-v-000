WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2],
]

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board) == true
    puts "Cat's Game!"
  end
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

def current_player(board)
  if turn_count(board).even?
    return "X"
  else turn_count(board).odd?
    return "O"
  end
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
  board.each {|value| if value == "X" || value == "O" then counter += 1 end}
    return counter
end


def won? (board)
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.detect do |win_index|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
       board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X" || board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
      end
    end
  end

  def full? (board)
    board.all? {|position| position == "X" || position == "O"}
  end

  def draw? (board)
    if won?(board) == nil && full?(board) == true
      return true
    elsif won?(board) == false && full?(board) == false
      return false
    else won?(board) == true
      return false
    end
  end

  def over?(board)
     won?(board) || full?(board) || draw?(board)
  end

  def winner(board)
  if winning_index = won?(board)
    board[winning_index.first]
  end
end
