WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
user_char = " "
#index = 1

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board) != false
    win_char = winner(board)
    puts "Congratulations #{win_char}!"


  else draw?(board) == true
    puts "Cat's Game!"
  end

end

def display_board(board) #duh
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input) #conver input move to board array index
  user_input.to_i - 1
end



def position_taken?(board, index) #is there already a X/O
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " " || board[index] == "" || board[index] == nil
    false
  end
end

def valid_move?(board, index) #can't make move to occupied space
    if index.between?(0, 8) && (position_taken?(board, index) == false)
      true
    elsif (index.between?(0,8) == false) || (position_taken?(board, index) == true)
      false
    end

end

def turn(board) #cycles to put valid user move into [board]
  puts "Please enter 1-9:"
  #user_char = "X"
  user_input = gets.strip
  user_char = current_player(board)
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, user_char)
  else turn(board) #restarts turn if invalid move
  end
  display_board(board)
end

def move(board, index, user_char) #put X/O in the appropriate space
  board[index] = user_char
end

def turn_count(board) #counts already made moves
  turns=0
  board.each do |board_space|
    if board_space == "O" || board_space == "X"
      turns +=1
    end
  end
  turns
end

#Converts even/odd number of board elements to whose turn it is
def current_player(board)
  if (turn_count(board) % 2) == 0
    player = "X"
  elsif (turn_count(board) % 2) != 0
    player = "O"
  end
end

def won?(board) #returns FALSE OR winning line array (called by #winner)
  any_return = WIN_COMBINATIONS.any? do |combo|
    board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||
      board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
  end
    select_return =  WIN_COMBINATIONS.select do |combo|
      board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||
        board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
  end
  if any_return == false
    any_return
  elsif select_return != nil
    win_return = select_return[0]
  end
end

def full?(board) #is every board space taken with X/O?
  board.all? do |board_element| board_element == "X" || board_element == "O" end
end

def draw?(board) #is current board full but not won?
    full?(board) == true && won?(board) == false
end

def over?(board) #is game won, drawn, or full?
  full?(board) == true || won?(board) != false || draw?(board) == true
end

def winner(board) #returns winning line array
  if won?(board) != false
    win_line = won?(board)
    board[win_line[0]]
  end
end
