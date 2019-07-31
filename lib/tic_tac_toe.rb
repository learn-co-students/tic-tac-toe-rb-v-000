WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]

def display_board(b)
  puts "-----------"
  puts " #{b[0]} | #{b[1]} | #{b[2]} "
  puts "-----------"
  puts " #{b[3]} | #{b[4]} | #{b[5]} "
  puts "-----------"
  puts " #{b[6]} | #{b[7]} | #{b[8]} "
  puts "-----------"
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, pos, token)
  board[pos] = token
end

def position_taken?(board, pos)
  board[pos] != " "
end

def valid_move?(board, pos)
  if !position_taken?(board,pos) && pos.between?(0,8)
    return true
  else
    return false
  end
end

def turn(board)
  input = gets.chomp
  i = input_to_index(input)
  if valid_move?(board, i)
    move(board, i, current_player(board))
  else
    puts "Sorry. Please try again."
    turn(board)
  end
end

def turn_count(board)
  board.count {|x| x != " "}
end

def current_player(board)
  return "X" if turn_count(board).even?
  return "O" if turn_count(board).odd?
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    ttt = []
    combo.each do |x|
      ttt << board[x]
    end
    return combo if ttt.uniq.count === 1 && !ttt.any?(" ")
  end
  return false
end

def full?(board)
  if !board.any?(" ")
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !!won?(board)
    board[won?(board)[0]]
  else
    return nil
  end
end

def play(board)
  while !over?(board)
    puts "Please enter a number between 1-9"
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
