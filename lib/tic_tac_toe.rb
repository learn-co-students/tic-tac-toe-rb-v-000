def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def move(board, location, player = "X")
  board[location.to_i-1] = player
end

def position_taken_o?(board, location)
  !(board[location].nil? || board[location] == " " || board[location] == "X")
end

def position_taken_x?(board, location)
  !(board[location].nil? || board[location] == " " || board[location] == "O")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], #horizontals
  [0,3,6],
  [1,4,7],
  [2,5,8], #verticals
  [0,4,8],
  [6,4,2], #diags
  ]

def won?(board)
  WIN_COMBINATIONS.any? do |combo|
    if combo.all? do |i|
      position_taken_x?(board, i)
      end
      return combo
      break
    elsif combo.all? do |i|
      position_taken_o?(board, i)
      end
      return combo
      break
    else
      false
    end
  end
end

def full?(board)
  #(0..8).none?{|i| position_taken?(board,i)}
  (0..8).all?{|i| position_taken?(board,i)}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  WIN_COMBINATIONS.any? do |combo|
    if combo.all? do |i|
      position_taken_x?(board, i)
      end
      puts "Congratulations X!"
      return "X"
      break
    elsif combo.all? do |i|
      position_taken_o?(board, i)
      end
      puts "Congratulations O!"
      return "O"
      break
    else
    end
  end
  puts "Cats Game!"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def play(board)
  until over?(board)
    turn(board)
  end
  winner(board)
end