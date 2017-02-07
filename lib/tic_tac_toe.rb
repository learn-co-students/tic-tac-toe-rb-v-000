def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |array|

    position1 = board[array[0]]
    position2 = board[array[1]]
    position3 = board[array[2]]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return array[0..2]
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return array[0..2]
    end
  end
  return false
end

def full?(board)
  board.each do |ele|
    if ele != "X" && ele != "O"
      return false
    end
  end
  return true
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    index = won?(board)[0]
    return board[index]
  end
end

def turn_count(board)
  turns_taken = 0
  board.each do |pos|
    if pos == "X" || pos == "O"
      turns_taken += 1
    end
  end
  return turns_taken
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def display_board(array)
  puts " #{array[0]} | #{array[1]} | #{array[2]} "
  puts "-----------"
  puts " #{array[3]} | #{array[4]} | #{array[5]} "
  puts "-----------"
  puts " #{array[6]} | #{array[7]} | #{array[8]} "
end

def valid_move?(board, index)
  if index < board.length && index >= 0
    return !position_taken?(board, index)
  else
    false
  end
end

def input_to_index(input)
  index = input.to_i - 1
  return index
end

def move(board, position, player)
  board[position] = player
end

def turn(board)
  puts "Please provide a move between 1-9?"
  choice = gets.chomp
  index = input_to_index(choice)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
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
  end
end

