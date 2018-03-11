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


def input_to_index(input)
  index = input.to_i - 1
end


def move(board,position,char)
  board[position] = char
end


def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    return false
  else return true
  end
end


def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  else return false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    char = current_player(board)
    move(board,index,char)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each { |space|
    if space == "X" || space == "O"
    counter += 1
    end
  }
  return counter
end


def current_player(board)
  turn_number = turn_count(board)
  return turn_number.even? ? "X" : "O"
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif
    position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
  end
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  false
  end
end


def full?(board)
  positions = []
  board.each { |i|
    if i == " " || i == nil
      positions << i
    end
  }
  if positions.length > 0
  false
  else
  true
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    true
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
  if over?(board) && won?(board)
    combo = won?(board)
    letter = combo[0]
    board[letter]
  else nil
  end
end


def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
