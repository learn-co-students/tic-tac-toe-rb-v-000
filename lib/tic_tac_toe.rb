WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(string)
  string.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board,index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  # the position is not taken and index is between 0-8
  !position_taken?(board, index) && index.between?(0,8)
  # && evaluations give implicit return of T / F
end

def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(board, index) # when writing a conditional statement, in most cases the eval is implicit.
      turn(board)
    else
      move(board, index, value = current_player(board)) # needed to define value in order for the method to work. set to current player to determine correct character
    end
    display_board(board)
  end

def turn_count(board)
      counter = 0
    board.each do | i|
      if i == "X" || i == "O"
      counter += 1
  end
  end
    counter
  end

def current_player(board)
    if turn_count(board) % 2 == 0
      return "X"
    else
      return "O"
    end
  end

def won?(board)
    WIN_COMBINATIONS.detect do |variable|
      win_index_1 = variable[0]
      win_index_2 = variable[1]
      win_index_3 = variable[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

  if position_1 == position_2 && position_2 == position_3 && position_1 != " "
    return variable # this return just the 3 winning indexes
      end
    end
  end

  def full?(board)
    board.all?{|char| char if char == "X" || char == "O"} # using the if statement setsup a implicit return and keeps the loop going.
  end


  def draw?(board)
    !won?(board) && full?(board)
  end

  def over?(board)
    draw?(board) || won?(board)
  end

  def winner(board)
    if winner_board = won?(board)
      board[winner_board.first] #variable stores winning combo (index array) / then takes winning index and compares to winning characters on the board. then it grabs the first winning character.
    end
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
