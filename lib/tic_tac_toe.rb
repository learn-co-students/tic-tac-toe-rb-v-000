
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
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-"* 11
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-"* 11
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    turn(board)
  end

  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |position|
    if position != " "
      count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  winning_combo = nil
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X")
      winning_combo = combo
    elsif (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      winning_combo = combo
    else
      false
    end
  end

  winning_combo
end


def full?(board)
  if board.include?(" ")
    false
  else board.include?("X" || "O")
    true
  end
end

def draw?(board)
  if won?(board)
    false
  elsif !(full?(board))
    false
  else full?(board)
    true
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
  winning_combo = won?(board)

  winning_combo ? board[winning_combo[0]] : nil
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if draw?(board)
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
