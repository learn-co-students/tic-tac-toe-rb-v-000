WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8], #right column win
  [0,4,8], #left vertical win
  [2,4,6] #right vertical win
]

board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input = "1 ... 10")
   user_input .to_i - 1
end

def move(board, index, value)
    board[index] = value
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
    else board[index] == [" "] || [""] || nil
      false
    end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
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
    move(board, index, current_player(board))#value="X"||"O"
    display_board(board)
  else
    turn(board)
    display_board(board)
      end
end

def turn_count(board)
  counter = 0
   board.each do |turn|
     if turn == "X" || turn == "O"
      counter += 1
     end
   end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    win_index_1 = win[0] #top row win
    win_index_2 = win[1] #middle row win
    win_index_3 = win[2] #bottom row win
    win_index_4 = win[3] #left column win
    win_index_5 = win[4] #middle column win
    win_index_6 = win[5] #right column win
    win_index_7 = win[6] #left diagonal win
    win_index_8 = win[7] #right diagonal win

    position_1 = board[win[0]]
    position_2 = board[win[1]]
    position_3 = board[win[2]]

if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    WIN_COMBINATIONS
    else
    false
    end
  end
end

def full?(board)
    board.all? do |position|
    if position==" "
    else
      position=="X" || "O"
    end
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
      win_array = won?(board)
      board[win_array[1]]
  else
        nil
  end
end


def play(board)
  num_of_turns = 0
  current_player(board)
  until over?(board)
  turn(board)
  num_of_turns += 1
  break if turn_count(board) >= 10
  end
  num_of_turns

  if winner(board) == "X"
     puts "Congratulations X!"
   elsif winner(board) == "O"
     puts "Congratulations O!"
   else draw?(board)
     puts "Cats Game!"
     end
   end
