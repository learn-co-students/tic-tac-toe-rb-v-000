board = [" "," "," "," "," "," "," "," "," "]
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
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(user_input)# code your input_to_index and move method here!
  user_input.to_i - 1
end
def move(board, index, char = "X")
  board[index] = char
end
ef position_taken?(board, index)
  if ((board[index] == " ") || (board[index] == "") || (board[index] == nil) )
    false
  else
    true
end
end
def valid_move?(board, index)
  if (index.between?(0,8)) && (position_taken?(board, index))
    true
  else
    false
  end
end
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, char = "X")
    display_board(board)
  else
    turn(board)
  end
  display_board(board)
end
def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
turns
end
def current_player(board)
turn_count(board) % 2 == 0 ? "X" : "O"
end
def won?(board)

  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination
    else
      false
    end
  end
end
def full?(board)
  !board.any? { |x| x == " " }
end
def draw?(board)
   if !won?(board) && full?(board)
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
  if win_combination = won?(board)
    board[win_combination.first]
  end
end
def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
   puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
