# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

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
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board).even?
    current_player = "X"
  else
    current_player = "O"
  end
end


def won?(board)
  winning_combo = false
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  else
    WIN_COMBINATIONS.each do |wins|
      pers1 = "X"
      pers2 = "O"
      if board[wins[0]] == pers1 && board[wins[1]] == pers1 && board[wins[2]] == pers1 ||
        board[wins[0]] == pers2 && board[wins[1]] ==pers2 && board[wins[2]] ==pers2
        winning_combo = wins
      end
    end
    winning_combo
  end
end


def full?(board)
  if board.include?(' ') || board.include?('')
    return false
else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  winning_combo = won?(board)
  if winning_combo
    index = winning_combo[0]
    winner = board[index]
    return winner
  else
    return nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  else
    draw?(board)
    puts "Cat's Game!"
  end
end
