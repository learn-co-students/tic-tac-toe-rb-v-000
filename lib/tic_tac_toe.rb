WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def player_move(board,input_to_index,player)
  board[input_to_index] = player
end

def position_taken?(board, index)
  board[index] != "" && board[index] != " " && board[index] != NIL
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board, index)
      player=current_player(board)
      player_move(board,index,player)
      display_board(board)
  else
    puts "That move isn't valid."
    turn(board)
  end
end

def turn_count(board)
  moves = 0
  board.each do |space|
    if space == "X" || space == "O"
    moves += 1
    end
  end
  moves
end

def current_player(board)
  turn_count(board)
  player = ""
  moves = turn_count(board)
  if moves.even? 
    player = "X"
  else 
    player = "O"
  end
  player
end

def won?(board)
    WIN_COMBINATIONS.each do |win_index|
      win_index_1 = win_index[0]
      win_index_2 = win_index[1]
      win_index_3 = win_index[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_index
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_index
        end
    end
     false
end

def full?(board)
  board.all? {|square| square != " "}
end

def draw?(board)
  full?(board) && !won?(board)
  end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
else
end

def winner(board)
  if won?(board)
  winning_player = board[(won?(board)[0])]
  return winning_player
else
end
end


def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winning_player=winner(board)
    puts "Congratulations #{winning_player}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end