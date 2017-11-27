WIN_COMBINATIONS = [
[0,1,2],#top row
[3,4,5],#middle row
[6,7,8],#bottom row
[0,3,6],#left column
[1,4,7],#middle column
[2,5,8],#right column
[0,4,8],#diagonal l to r
[2,4,6]#diagonal r to l
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
  if valid_move?(board, index) != true
    input = gets.strip
  else
    #this only works if I set a default argument; shouldn't the program ask for this input?
    return move(board, index, current_player(board))
  end
    display_board(board)
end


def turn_count(board)
  count = 0
  board.each do |marker|
    if marker == "X" || marker == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won? (board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if [position_1, position_2, position_3].all? {|symbol| symbol == "X"}
      return win_combination
    elsif [position_1, position_2, position_3].all? {|symbol| symbol == "O"}
       return win_combination
     end
   end
   false
 end

 def full?(board)
  !board.include?(" ") #if board does not include a space
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if WIN_COMBINATIONS.include?(won?(board))
    index = won?(board)[0]
    return board[index]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
