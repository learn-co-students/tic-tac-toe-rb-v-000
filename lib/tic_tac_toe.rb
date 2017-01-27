WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
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

def turn_count(board)
  turns = 0
  board.each do |check|
    if check == "X" || check == "O"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  return player = turn_count(board).even? ? "X": "O"
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current_player = current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1= win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == position_2 && position_2 == position_3
       return win_combination
      end
    else
      false
    end
  end
  false
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end






def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    winning_array = won?(board)
    winning_index = winning_array[0]
    return board[winning_index]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  else
  end
end
