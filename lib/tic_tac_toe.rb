WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
]

def display_board(board)
# board array value might be "X", "O", " ", " ", " ", " ", " ", " ", " "]
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(integer)
  integer.to_i-1
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board, position)
  if !(board[position] == nil || board[position] == " ")
    true
  else
    false
  end
end

def valid_move?(board, position)
  if !position_taken?(board, position) && position.between?(0,8)
    true
  else
    false
  end
end

def turn_count(board)
  # we first need a counter to keep track of turns
  # we need to iterate the board in order to increment the counter
  # then we need to return the counter
  board.count{|pos| pos != " "}
  # count = 0
  # board.each do |pos|
  #   if pos == "X" || pos == "O"
  #     count += 1
  #   end
  # end
  # count
end

def current_player(board)
  # turn_count(board).even? ? "X" : "O"
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end


def turn(board)
  puts "Please enter 1-9:"
  integer = gets.strip
  position = input_to_index(integer)
  if valid_move?(board, position)
    # when we pass in values ofr the move method
    # board will be the value of the board
    # the position will be the index value we are going to set for that particular element
    # now the third position - we need the current token "X", or "O" for the current players turn
    # we pass the value of the current_player(board) which will be "X" or "O" as the third position to be sent to the placeholder of char in the move argument
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(full_board)
  full_board.all? do |pos|
    pos == "X" || pos == "O"
  end
end

  def draw?(board)
    if full?(board) && !won?(board)
      true
    else
      false
    end
  end

  def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end

def play(board)
  while !over?(board)
    turn(board)
end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
