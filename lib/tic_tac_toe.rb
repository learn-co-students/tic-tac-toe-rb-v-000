WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn_count(board)
  temp=board.select do |i|
    i=="X" || i=="O"
  end
  temp.length
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    arr=""
    combo.each do |i|
      if position_taken?(board,i)
        arr= arr + board[i]
      end
    end
    if (arr== "OOO") || (arr=="XXX")
      return combo
    end
  end
  return false
end

def turn(board)
  puts "Please enter 1-9:"
  i=gets.strip
  i=input_to_index(i)
  while !valid_move?(board,i)
    puts "Please enter 1-9:"
    i=gets.strip
    i=input_to_index(i)
  end
  move(board,i,current_player(board))
  display_board(board)
  return board
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  (!won?(board)) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)==false
    return nil
  end
  board[won?(board)[0]]
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
