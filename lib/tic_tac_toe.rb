WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #column 1
  [1, 4, 7], #column 2
  [2, 5, 8], #column 3
  [0, 4, 8], #diagonal 1
  [2, 4, 6] #diagonal 2
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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  count = 0
 board.each do |turns|
   if turns == "X" || turns == "O"
     count += 1
   end
 end
   return count
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
      return combo
    end
  end
  false
end

def full?(board)
 board.all?{|plays| plays != " "}
end

def draw?(board)
 if won?(board).class == Array
   return false
 elsif full?(board) == true
   return true
 else
   return false
 end
end

def over?(board)
  full?(board) == true || won?(board).class == Array
end

def winner(board)
  if (won?(board).class == Array) && (board.select{|plays| plays == "X"}.count > board.select{|plays| plays == "O"}.count)
    return "X"
  elsif (won?(board).class == Array) && (board.select{|plays| plays == "O"}.count >= board.select{|plays| plays == "X"}.count)
    return "O"
  else
    return nil
  end
end

def play(board)
  until over?(board) == true || draw?(board) == true || won?(board) != false
    turn(board)
  end

  if won?(board) != false
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end
