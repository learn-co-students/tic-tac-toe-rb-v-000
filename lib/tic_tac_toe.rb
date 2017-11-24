WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # left column
  [1,4,7],  # middle column
  [2,5,8],  # right column
  [0,4,8],  # left diagonal
  [2,4,6]  # right diagonal
]

board = [" "," "," "," "," "," "," "," "," "]

def display_board(array)
puts " #{array[0]} | #{array[1]} | #{array[2]} "
puts "-----------"
puts " #{array[3]} | #{array[4]} | #{array[5]} "
puts "-----------"
puts " #{array[6]} | #{array[7]} | #{array[8]} "
end

def input_to_index(user_input_index)
 return ((user_input_index.to_i) - 1)
end

def input_to_index(user_input_index)
 return ((user_input_index.to_i) - 1)
end

def position_taken? (board, index)
 if board[index] == " " || board[index] == "" || board[index] == nil
   return false
 else board[index] == "X" || board[index] == "O"
  return true
 end
end

def valid_move?(board, index)
  if index.between?(0,8)
    if position_taken?(board,index) == false
      return true
    else
      return false
    end
  else
    return false
  end
end

def move(board, index, current_player)
  board[index] = current_player
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current_player = current_player(board)
  if valid_move?(board,index)
    position_taken?(board,index)
    move(board,index,current_player)
    display_board(board)
  else turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if (position == "X" || position == "O")
      counter += 1
    end
  end
  counter
end

def current_player (board)
    player_turn = turn_count(board)
    (player_turn % 2) == 0 ? "X" : "O"
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
  if board.include?(nil)
    return false
  elsif board.include?(" ")
    return false
  else
    return true
  end
end


def draw?(board)
  won_result = won?(board)
  full_result = full?(board)
  if !won_result && full_result
    return true
  elsif !won_result && full_result
    false
  elsif won_result
    false
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    if board[win_combination[0]] == "X"
      return "X"
    elsif board[win_combination[0]] == "O"
      return "O"
    end
  else
    nil
  end
end

  def play (board)
    while !over?(board)
     turn(board)
     end

     if won?(board)
       winner = winner(board)
       puts "Congratulations #{winner}!"
     elsif draw?(board)
       puts "Cat's Game!"
     end
  end
