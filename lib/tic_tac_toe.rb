
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

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input = input.to_i - 1
end

def move(board, input, value)
  board[input] = value
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip

  index = input_to_index(input)

  player = current_player(board)

  if valid_move?(board, index) == true
    move(board, index, player)
    display_board(board)
  else
    puts "That is not a valid move"
    turn(board)
  end
end

def current_player(board)
  x = 0

  board.each do |moves|
    if moves == "X" || moves == "O"
      x += 1
    end
  end

  if x % 2 == 1
    "O"
  else
    "X"
  end
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  if index < 9 && index >= 0 && (board[index] == " " || board[index] == nil)
    true
  else
    false
  end
end

def turn_count(board)
  x = 0

  board.each do |moves|
    if moves == "X" || moves == "O"
      x += 1
    end
  end

  x
end

def won?(board)
  if board.all? {|index| index == " "} == true && board.all? {|index| index == 'X' || index == 'O'} == true
    return false
  else
    WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
        return combo
      end
    end

  end
  return false
end

def full?(board)
  if board.all? {|index| index == 'X' || index == 'O'}
    true
  elsif board.any? {|index| index == " "}
    false
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif full?(board) == false
    return false
  end
end

def over?(board)
  if full?(board) == false
    false
  else
    true
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
    combo = won?(board)
    board[combo[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)

    if won?(board)
      puts "Congratulations #{winner(board)}!"
      break
    elsif draw?(board)
      puts "Cats Game!"
      break
    end
  end
end
