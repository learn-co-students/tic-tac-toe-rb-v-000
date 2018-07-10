WIN_COMBINATIONS = [
  [0, 1, 2], #Top Row
  [3, 4, 5], #Middle Row
  [6, 7, 8], #Bottom Row
  [0, 3, 6], #Left Column
  [1, 4, 7], #Middle Column
  [2, 5, 8], #Right Column
  [0, 4, 8], #Left Diagonal
  [2, 4, 6] #Right Diagonal
]

#GAME BOARD
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#CHANGES USER INPUT TO INDEX
def input_to_index(user_input)
  converted_input = user_input.to_i - 1
end

#DEFINES TIC TAC TOE MOVE
def move(board, position, character)
  board[position] = character
end

#IS THIS POSITION TAKEN?
def position_taken? (board, index)
  !(board[index] == " " || board[index] == "" || board[index] == nil)
end

#IS THIS A VALID MOVE?
def valid_move? (board, index)
  if(index.between?(0,8) && !position_taken?(board,index))
    return true
  else
    return false
  end
end

#ASKS USER FOR TURN INPUT
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

#COUNTS NUMBER OF TURNS
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
return counter
end

#DISPLAYS CURRENT PLAYER
def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
return current_player
end

#DISPLAYS WINNING COMBINATION
def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
  if board[wincombo[0]] == "X" && board[wincombo[1]] == "X" && board[wincombo[2]] == "X"
    return wincombo
  elsif board[wincombo[0]] == "O" && board[wincombo[1]] == "O" && board[wincombo[2]] == "O"
    return wincombo
  end
end
false
end

#ASKS IF THE BOARD IS FULL
def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

#IF GAME ENDS IN DRAW
def draw?(board)
    if !won?(board) && full?(board)
      return true
    else
      return false
    end
end

#IF GAME IS OVER
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

#DISPLAYS WINNER OF GAME
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

#DISPLAYS GAME LOOP
def play(board)
  until over?(board)
      turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
