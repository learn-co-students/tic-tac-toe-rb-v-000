WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2]
]

def play(board)

#  until the game is over
#    take turns
#  end
#  if the game was won
#    congratulate the winner
#  else if the game was a draw
#    tell the players it has been a draw
#  end

  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
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
  converted_input = user_input.to_i - 1
end

def move(array,index,value)
  array[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  index_new = index.to_i
  index_new.between?(0,8) && !position_taken?(board,index)
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end


def current_player(board)
  if turn_count(board)  % 2 == 0
    "X"
  else
    "O"
  end
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  converted_input = input_to_index(input)
  if valid_move?(board,converted_input)
    #make move
    value = current_player(board)
    move(board,converted_input,value)
    display_board(board)
  else
    #invalid move
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    #gets the value from board with index equal to winning combination
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    else
      false
    end

    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end

  end
  false

end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
    if won?(board) == false
      nil
    else
      board[won?(board)[0]]
    end
end
