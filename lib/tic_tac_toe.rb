WIN_COMBINATIONS =
[
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
puts " #{board [0]} | #{board [1]} | #{board [2]} "
puts "-----------"
puts " #{board [3]} | #{board [4]} | #{board [5]} "
puts "-----------"
puts " #{board [6]} | #{board [7]} | #{board [8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
!(board[index].nil? || board[index] == " " || board[index] == "")
end

def valid_move?(board,index)
    index.between?(0, 8) && !(position_taken?(board,index))
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip.to_i
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, default = "X")
    display_board(board)
  else
    turn(board)
end
end

def turn_count(board)
  counter = 0
  board.each do |game_move|
    if game_move == "X" || game_move == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
WIN_COMBINATIONS.each do |win_index|
  position_1= board[win_index[0]]
  position_2= board[win_index[1]]
  position_3= board[win_index[2]]

if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_index
end
end
false
end

def full?(board)
board.none? {|board_space| board_space == " "}
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  board.each do |board_space|
    if won?(board) || full?(board) || draw?(board)
      return true
    end
  end
  false
end

def winner(board)
WIN_COMBINATIONS.each do |win_index|
    position_1= board[win_index[0]]
    position_2= board[win_index[1]]
    position_3= board[win_index[2]]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O"
  end
end
nil
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
