WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [8,4,0],
  [6,4,2],
]

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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, index, token)
  board[index] = token
  board
end

def position_taken?(board, position)
return false if [" ", ""].include?(board[position])
return true if ["X", "O"].include?(board[position])
end

def valid_move?(board, index)
  if index.between?(0, 8)
    if !position_taken?(board, index)
      true
    end
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win|
    board[win[0]] == board[win[1]] &&
    board[win[1]] == board[win[2]] &&
    position_taken?(board, win[0])
  end
end

def full?(board)
  board.all?{|token|  token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) and full?(board)
end

def over?(board)
  won?(board)  or full?(board)
end

def winner(board)
  if winning_win = won?(board)
    board[winning_win.first]
  end
end

def input_to_index(input)
  index = input.to_i - 1
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board, index)
     move(board, index, current_player(board))
     display_board(board)
   elsif
     turn(board)
   end
 end

def turn_count(board)
  turns = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      turns += 1
      end
  end
  turns
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end
