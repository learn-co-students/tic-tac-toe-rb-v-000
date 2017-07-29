WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
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

# def move(board, index, token = "X")
#   board[index] = token
# end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# def position_taken?(board, index)
#   pos = board[index]
#   if pos == " " || pos == "" || pos.nil?
#     return false
#   elsif pos == "X" || pos == "O"
#     return true
#   end
# end

# def valid_move?(board, index)
#   index.between?(0,8) && !position_taken?(board, index)
# end

def valid_move?(board, index)
  # Is the position taken?
  pos_taken = position_taken?(board, index)
  # Is the position on the board?
  on_board = index.between?(0, board.length - 1)
  # If position is open and on the board, return true,
  if !pos_taken && on_board
    return true
  else
    return false
  end
end

def turn(board)
  #asks for input
  puts "Please enter 1-9:"
  #gets input
  user_input = gets.strip
  #convert input to index
  index = input_to_index(user_input)
  #if index is valid
  if valid_move?(board, index) == true
    # make the move for input
    current_token = current_player(board)
    move(board, index, current_token)
    display_board(board)
  else
    #ask for input again until you get a valid input
    #puts "#{index + 1} is not a valid position, try again."
    turn(board)
  end
end

def turn_count(board)
  number_of_turns = 0
  board.each do |position|
    if position != " "
      number_of_turns += 1
    end
  end
  return number_of_turns
end

def current_player(board)
  # determine if number of turns taken is even or odd return "X" if even, return "O" if odd
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] \
    && board[win_combination[2]] == board[win_combination[1]] \
    && board[win_combination[0]] != " "
  end
end

def full?(board)
  open_spaces = board.select do |index|
    index == " "
  end
    return open_spaces.length <= 0
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  winning_positions = won?(board)
  # returns nil unless winning_positions is truthy
  return nil unless winning_positions
  return board[winning_positions[0]]
end

# def play(board)
#   player_turn = 0
#   loop do
#     turn(board)
#     player_turn += 1
#     if player_turn >= 9
#       break
#     end
#   end
# end
# over? false while game is not over
#over? true while game is over
#until over take turns

def play(board)
  while !over?(board) #while CONDITION == TRUE do something, else stop
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
