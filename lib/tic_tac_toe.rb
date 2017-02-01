WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)
  separator = "-----------"
  puts " #{board[0]} "+"|"+" #{board[1]} "+"|"+" #{board[2]} "
  puts separator
  puts " #{board[3]} "+"|"+" #{board[4]} "+"|"+" #{board[5]} "
  puts separator
  puts " #{board[6]} "+"|"+" #{board[7]} "+"|"+" #{board[8]} "
end

def valid_move?(board, index)
  position_taken?(board,index) == false && index.between?(0,8) == true
end

def position_taken?(board, index)
  !(board[index] == " " || board[index] == "" || board[index] == nil)
end

def input_to_index(input = "1")
  board_input = input.to_i
  index = board_input -1
end

def turn_count(board)
  counter = 0
  board.each do |spot|
    if (spot == "O" || spot == "X")
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if (turn_count(board) % 2 == 0)
    "X"
  else
    "O"
  end
end

def move(board,index,char)
  board[index] = char
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
   if valid_move?(board, index)
     move(board,index,current_player(board))
     display_board(board)
   else
     turn(board)
   end
end



def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_combination
    else
      false
    end
  end
end

def full?(board)
  board.none?{|free| (free == " " || free == nil)}
end

def draw?(board)
  if !won?(board)
    full?(board)
  else
    false
  end
end

def over?(board)
  draw?(board) == true || !!won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if !!won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
