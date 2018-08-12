WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left columns
  [1,4,7], #middle columns
  [2,5,8], #right column
  [0,4,8], #diagonals
  [2,4,6] #diagonal
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
  board.each do |spot|
    if spot == "X" or spot == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 != 0
    return "O"
  else
    return "X"
  end
end

def won?(board)
  empty = board.all? {|spot| spot == " "}
  full = board.none? {|spot| spot == " "}
  if empty == true
    return false
  elsif
    WIN_COMBINATIONS.each do |win_combo|
      windex_1 = win_combo[0]
      windex_2 = win_combo[1]
      windex_3 = win_combo[2]

      pos_1 = board[windex_1]
      pos_2 = board[windex_2]
      pos_3 = board[windex_3]

      if pos_1 == pos_2 && pos_1 == pos_3 && pos_1 != " "
        return win_combo
      end
    end
  elsif full == true
    return false
  end
end

def full?(board)
  full = board.none? {|spot| spot == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if !draw?(board) && !won?(board)
    return false
  else
    return true
  end
end

def winner(board)
  win_combo = won?(board)
  if won?(board)
    return board[win_combo[0]]
  else
    return nil
  end
end

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

#def play(board)
#  turn(board)
#  over?(board)
#  if won?(board)
#    puts "Congratulations #{winner(board)}!"
#  elsif draw?(board)
#    puts "Cat's Game!"
#  else
#    play(board)
#  end
#end
