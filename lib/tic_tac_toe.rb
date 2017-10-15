def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index <= 8 && index >= 0 && position_taken?(board,index) == false
    return true
  else
    return false
  end
end

def move(board, index, char)
  board[index] = char
end

def turn(board)
  puts "Please enter 1-9:"

  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index) == true
    move(board,index,current_player(board))
    display_board(board)
  else
    turn (board)
  end
end

def turn_count(board)
  count = 0
  board.each do |place|
    if place != " "
      count += 1
    else
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end


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


def won?(board)
  winning_array = []
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winning_array = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winning_array = win_combination
    else
    end
  end
  if winning_array.empty?
    false
  else
    winning_array
  end
end

def full?(board)
    board.none? {|place| place == " "}
end

def draw?(board)
  if full?(board)
    if won?(board) != false
      false
    else
      true
    end
  else
    false
  end
end

def over?(board)
  if won?(board) != false
    true
  elsif draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
    return nil
  end
end

def play(board)
  loop do
    if over?(board) == false
      turn(board)
    elsif won?(board) != false
      puts "Congratulations #{winner(board)}!"
      break
    else
      puts "Cat's Game!"
      break
    end
  end
end
