WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board = [" ", " " , " ", " ", " ", " ", " ", " ", " "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board,index)
  if position_taken?(board,index)
    return false
  elsif index.between?(0, 8)
    return true
  end
end

def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    #character = current_player(board)
    if valid_move?(board,index)
      move(board,index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
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
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
    end
  end
end

def full?(board)
  board.all?{|position|position == "X" || position == "O"}
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
   won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) && over?(board)
    win_combination = won?(board)
    win_index = win_combination[1]
    return board[win_index]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
    if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    # elsif over?(board) && draw?(board)
     puts "Cat's Game!"
   end

end
