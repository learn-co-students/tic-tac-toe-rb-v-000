WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6]
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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index] == " " || board[index] == "" || board[index] == nil)
end

def valid_move?(board, index)
  if index.between?(0,8)
    !position_taken?(board, index)
  end
end

def turn(board)
  puts "Enter number 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    counter += 1 if position == "X" || position == "O"
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return combo
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end
  end
  false
end

def full?(board)
  !board.any?{|position| position == " "}
end

def draw?(board)
  if full?(board)
    if won?(board)
      return false
    else
      return true
    end
  end
  false
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  while !over?(board) do
    display_board(board)
    turn(board)
    # puts "count: #{counter} "
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
