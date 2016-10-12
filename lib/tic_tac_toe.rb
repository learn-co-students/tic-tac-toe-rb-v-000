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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, pos, char)
  board[pos] = char
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
 input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)

  board.count {|x| x if x =="X" || x == "O" }

end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
end
end

def won?(board)
   WIN_COMBINATIONS.each do |win_combination|
    win_index_0 = win_combination[0]
    win_index_1 = win_combination[1]
    win_index_2 = win_combination[2]
    win_index_3 = win_combination[3]
    win_index_4 = win_combination[4]
    win_index_5 = win_combination[5]
    win_index_6 = win_combination[6]
    win_index_8 = win_combination[8]

    if board[win_index_0] == "X" && board[win_index_1] == "X" && board[win_index_2] == "X"
      return win_combination
    elsif board[win_index_0] == "O" && board[win_index_1] == "O" && board[win_index_2] == "O"
      return win_combination
        elsif board.all? { |i| i == " " }
      return false

        else
      next
    end
  end
  false
end

def full?(board)
  board.each do |x|
     if x == ' '
       return false
     end
  end
  true
end

def draw?(board)
  if full?(board) && !won?(board)
      true
  else
    false
end
end


def over?(board)
   if draw?(board) || won?(board)
      true
    else
       false
     end
end

def winner(board)
 win = won?(board)
  if win
    board[win[0]]
 else
   nil
 end
end

def play(board)
  until over?(board) == true
  turn(board)
  end
if won?(board) != false
  character = winner(board)
  puts "Congratulations #{character}!"
elsif draw?(board)
  puts "Cats Game!"
  end
  end
