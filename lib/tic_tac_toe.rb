#helper methods
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = input.to_i - 1
end


def move (board, index, player)
  board[index] = player
end


def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    board[index] == "X" || board[index] == "O"
    true
  end 
end


def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false 
    true
  else position_taken?(board, index) == true
    false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, player = current_player(board))
    display_board(board)
  else
    turn(board)
  end
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
  turn_count(board).even? ? "X" : "O"
end


def won?(board)
  WIN_COMBINATIONS.each do |win_comb| #win_comb = [0, 1, 2]
      win_index_1 = win_comb[0] #win_index_1 = 0
      win_index_2 = win_comb[1]
      win_index_3 = win_comb[2]
      
      position_1 = board[win_index_1] #board[0]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 =="X" || position_1 == "O" && position_2 == "O" && position_3 =="O"
          return win_comb
      end
    end
    false
  end


def full?(board)
  board.all? do |full|
     full == "X" || full == "O"
  end
end


def draw?(board)
  if won?(board) == false && full?(board) == true 
    return true 
 # elsif won?(board) == false && full?(board) == false || won?(board)
  else
    return false
  end
end


def over?(board)
  if won?(board) || draw?(board) == true || full?(board) == true 
    return true 
  end
end


def winner(board)
  if won?(board) == false
    return nil
  else
    player = won?(board)
  winner_player = player[0]
  winner_player_1 = board[winner_player]
  end 
end


def play(board)
  until over?(board) == true
      turn(board)
      
  end
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true 
    puts "Cat's Game!"
  end
end