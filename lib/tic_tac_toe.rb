WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Right to left diagonal
  [2,4,6], # Left to right diagonal
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
]

def display_board(board)

  board = board.each_slice(3).to_a
  final_board = []

  board.each do |a|
    final_board << a.join(" | ")
  end

  for row in (0..final_board.length-1)
    if row > 0
      print "-----------\n"
    end
    print " " + final_board[row] + " \n"
  end

  nil
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  !(board[index] == " " || board[index] == "")
end

def valid_move?(board, index)
  index >= 0 && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |char|
    if char == "X" || char == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  total_turns = turn_count(board)
  if total_turns % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  for comb in WIN_COMBINATIONS
    win_1 = comb[0]
    win_2 = comb[1]
    win_3 = comb[2]

    if ![board[win_1], board[win_2], board[win_3]].any? { |e| e == " " }
       if board[win_1] == board[win_2] && board[win_2] == board[win_3]
         return comb
       end
    end
  end
  false
end

def full?(board)
  !board.any? { |empty_spot|  empty_spot == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  # returns t for won, draw or full
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
  # return the char that won
  index = won?(board)

  if index
    return board[index[0]]
  else
    return nil
  end
end

def play(board)
  turn = 0
  until turn == 9
    if !over?(board)
      turn(board)
    elsif won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"


    end
    turn += 1

  end
end
