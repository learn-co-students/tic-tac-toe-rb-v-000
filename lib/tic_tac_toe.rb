def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

def move(board, position, player)
  board[position] = player
end

def position_taken?(board,position)
  (board[position] == "X" || board[position] == "O")? true : false
end

def valid_move?(board, position)
  (!position_taken?(board, position) && position.between?(0,8))? true : false
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, player = current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |b|
    if b == "X" || b == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  counter = turn_count(board)
  counter % 2 == 0 ? "X" : "O"
end

def won?(board)
  
  WIN_COMBINATIONS.each do |combo|
    win_in_1 = combo[0]
    win_in_2 = combo[1]
    win_in_3 = combo[2]
    
    pos_1 = board[win_in_1]
    pos_2 = board[win_in_2]
    pos_3 = board[win_in_3]
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O" )
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? {|i| (i == "X" || i == "O")}
end

def draw?(board)
  (won?(board) == false && full?(board) == true)? true : false
end

def over?(board)
  (draw?(board) || full?(board) || won?(board))? true : false
end

def winner(board)
  if won?(board) 
    win_in = won?(board)[0] 
    winni = board[win_in]
    return winni
  else
    return nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
  
end

