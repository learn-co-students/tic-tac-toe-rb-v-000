WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8],# bottom row
  [0, 3, 6], # left row
  [1, 4, 7], # middle-vertical row
  [2, 5, 8], # right row
  [0, 4, 8], # left-diagonal row
  [2, 4, 6] # right-diagonal row
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, position)
  board[position] != " "
end

def valid_move?(board, position)
  position.between?(0, 8) && board[position] == " "
end

def turn(board)
  puts "Please enter 1-9:"
  input = input_to_index(gets.strip)
  char = current_player(board)


  if valid_move?(board, input)
    move(board, input, char)
    return display_board(board)
  end

  turn(board)
end

def turn_count(board)
  counter = 0

  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end

  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    one = combo[0]
    two = combo[1]
    three = combo[2]
    x = "X"
    o = "O"

    if board[one] == x && board[two] == x && board[three] == x
      return combo
    elsif board[one] == o && board[two] == o && board[three] == o
      return combo
    end
  end

  false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  if won?(board) != false || full?(board) || draw?(board)
    return true
  end

  false
end

def winner(board)
  if won?(board)
    save_index = won?(board) # array of winning combo
    return board[save_index[0]]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
