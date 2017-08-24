WIN_COMBINATIONS = [
  [0,1,2], # top_row
  [3,4,5], # middle_row
  [6,7,8], # bottom_row
  [0,3,6], # left_column
  [1,4,7], # center_column
  [2,5,8], # right_column
  [0,4,8], # left_diagonal
  [6,4,2]  # right_diagonal
]

def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
end   #this is the board displaying the proper board[index] in its array format

def input_to_index(user_input)
 user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false
  else
    return true   #board[index] is not " " or "" or nil because there's an "X" or "O"
  end
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
 else
    turn(board)
 end
 display_board(board)
end

def turn_count(board)
 counter = 0
 board.each do |spaces|
   if spaces == "X" || spaces == "O"
     counter += 1
   end
 end
 counter
end

def current_player(board)
 turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1) #detect returns first element (position_1) & make sure position is taken (that it's either an X or O).
  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board) #accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won.
  !won?(board) && full?(board)
end

def over?(board) #accepts a board and returns true if the board has been won, is a draw, or is full.
  if draw?(board) || won?(board) || full?(board)
    return true
  end
end

def winner(board) #accept a board and return the token, "X" or "O" that has won the game given a winning board.
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  #input = gets
  until over?(board) #until the game is over...
    turn(board) #players will keep taking turns
  end
  #plays the first few turns of the game
    if won?(board) #if there's a winner...
      winner(board) == "X" || winner(board) == "O" #we check who the winner is...
        puts "Congratulations #{winner(board)}!" #and congratulate them
    elsif draw?(board) #if there's a draw, then print the below strings
      puts "Cats Game!"
    end
end
