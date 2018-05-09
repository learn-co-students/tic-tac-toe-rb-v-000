#Win combinations constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def move(board, index, value)
  board[index] = value
  return board
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == 'X' || board[index] == 'O'
    return true
  end
end

def valid_move?(board, index)   #is the index even within the board?
  if index < 0 || index > 8
    return false
  else
    return !(position_taken?(board, index)) #checks to see if position is occupied
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  value = current_player(board)

  if valid_move?(board, index)
    move(board, index, value)
    display_board(board)
    return board
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  current_player = (turn_count(board) % 2 == 0) ? 'X' : 'O'
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|index| position_taken?(board, index)}

      first_value = board[combo[0]]
      second_value = board[combo[1]]
      third_value = board[combo[2]]

      if first_value == second_value && first_value == third_value
        return combo
      end
    end
  end
  return false
end

def full?(board)
  board.all?{|element| !(element == " ")}
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  end
end

def over?(board)
  if draw?(board)
    return true
  end

  if won?(board)
    return true
  end
end

def winner(board)
  if over?(board)
    winning_positions = won?(board)
    value = board[winning_positions[0]]
    if value.include?('X')
      return 'X'
    elsif value.include?('O')
      return 'O'
    else
      return nil
    end
  end
end

def play(board)
    while !over?(board)
      turn(board)
    end

    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
