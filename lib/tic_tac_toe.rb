def play(board)
  current = "X"
  until over?(board)
    current = current_player(board)
    turn(board)
    if won?(board) || draw?(board)
      break
    end
  end
  w = won?(board)
  if w 
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end




WIN_COMBINATIONS = [
      [0,1,2], [3,4,5], [6,7,8],
      [0,3,6], [1,4,7], [2,5,8],
      [0,4,8], [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
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

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |idx|
    if idx == "X" || idx == "O"
      count+=1
    end
  end
  count
end

def current_player(board)
  count = turn_count(board)
  if count%2==0
    return "X"
  else 
    return "O"
  end
end

def won?(board)
  won = false 
  WIN_COMBINATIONS.each do |combo|
    i0 = board[combo[0]]
    i1 = board[combo[1]]
    i2 = board[combo[2]]
    if (i0=="X" || i0=="O") && i0==i1 && i0==i2
      return combo
    end
  end
  won
end

def full?(board)
  board.all? {|i| !(i.nil? || i == " ")}
end

def draw?(board)
  ans = true
  if !(full?(board))
    ans = false
  end
  if won?(board)
    ans = false
  end
  ans
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  winner = won?(board)
  if winner 
    return board[winner[0]]
  else 
    return nil
  end
end

















