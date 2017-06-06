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
#----------DISPLAY BOARD-----------------------

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
#----------INPUT TO INDEX-----------------------

  def input_to_index(user_input)
    user_input.to_i - 1
  end
#----------MOVE-----------------------

  def move(board, new_input, char)
    board[new_input] = char
  end
#-----------POSITION TAKEN----------------------

  def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      return false
    else board[index] == "X" || board[index] == "O"
      return true
    end
  end
#-----------VALID MOVE----------------------

  def valid_move?(board, index)
      if index.between?(1,9)
      if !position_taken?(board, index)
      true
    end
  end

    index.between?(0,8) && !position_taken?(board, index)
  end

  def position_taken?(board, index)
    board[index] != " "
  end
#-----------TURN----------------------

def turn(board)
  char = current_player(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, char)
    display_board(board)
  else
    turn(board)
  end
end

#-----------TURN COUNT----------------------

def turn_count(board)
  counter = 0
  board.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
  end
  counter
end

#-----------CURRENT PLAYER----------------------

def current_player(board)
  count = turn_count(board)
  count % 2 == 0 ? "X" : "O"
end

#-----------WON----------------------

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end

#-----------FULL----------------------

def full?(board)
  board.all? {|check| check == "X" || check == "O"}
end

#-----------DRAW----------------------

def draw?(board)
  full?(board) && !won?(board)
end

#-----------OVER----------------------

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

#-----------WINNER----------------------
def winner(board)
  win = won?(board)
    if win
      board[win[0]]
    else
      nil
  end
end

#-----------PLAY----------------------

def play(board)
  until over?(board)
	turn(board)
  end
  draw?(board)
    puts "Cats Game!"
  winner(board)
    puts "Congratulations #{winner(board)}!"
end
