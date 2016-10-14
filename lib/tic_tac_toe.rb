#############
# RESOURCES #
#############

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


#########
# TOOLS #
#########

def input_to_index(user_input)
  user_input.to_i - 1
end


###################
# BOOLEAN METHODS #
###################

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo[0]) &&\
       board[combo[0]] == board[combo[1]] &&\
       board[combo[0]] == board[combo[2]]
      return combo
    end
  end
  nil
end

def full?(board)
  board.none? {|pos| pos == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end


###########
# POLLING #
###########

def turn_count(board)
  turn_num = 0
  board.each do |space|
    if space == "X" || space == "O"
      turn_num += 1
    end
  end
  turn_num
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end


##########
# ACTION #
##########

def move(board, position, token)
  board[position] = token
end


########
# PLAY #
########

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index, )
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
