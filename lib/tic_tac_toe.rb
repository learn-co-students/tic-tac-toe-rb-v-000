# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],  #Top row
  [3, 4, 5],  #Middle row
  [6, 7, 8],  #Bottom row
  [0, 3, 6],  #Left column
  [1, 4, 7],  #Middle column
  [2, 5, 8],  #Right column
  [0, 4, 8],  #First diagonal
  [2, 4, 6]   #Second diagonal
  ]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end



def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end


def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  player = current_player(board)
  if valid_move?(board, input)
    move(board, input, player)
  else
    turn(board)
  end
  display_board(board)
end


def turn_count(board)
  counter = 0
  location = 0
  while location < 9
    if position_taken?(board, location)
      counter += 1
    end
    location += 1
  end
  return counter
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
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]  #load the value of the board at win_index_1
    position_2 = board[win_index_2]  #load the value of the board at win_index_2
    position_3 = board[win_index_3]  #load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination    #return the win_combination indexes that won
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination    #return the win_combination indexes that won
    else false
    end
  end
  return false
end



def full?(board)
  board.all?{|p| p == "X" || p == "O"}
end


def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end



def over?(board)
  if draw?(board) || won?(board) || full?(board)
    true
  else
    false
  end
end



def winner(board)
  if won?(board) == false
    nil
  else
    winner = won?(board)[1]
    winner = board[winner]
   end
end


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
  else
    puts "Cats Game!"
  end
end





