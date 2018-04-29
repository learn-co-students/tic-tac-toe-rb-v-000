

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

def move(board, index, token)
   board[index] = token
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == nil
    return false
  elsif board[index] != "X" || board[index] != "0"
    return true
  end
end

def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  end
end

def turn(board)
  puts "please enter 1-9!"
   user_input = gets.chomp
   index = input_to_index(user_input)
  if valid_move?(board,index)
    return move(board, index, "X") && display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
 turn_count(board) = 3
end

def current_player
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||  (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return win_combination
  end
  end
false
end


def full?(board)
  if board.all? {|spot| spot == "X" || spot == "O"}
    return true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  end
end

def over?(board)

   !!won?(board) == true || draw?(board) == true
end



def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def move(board, location, player = "X")
  board[location.to_i-1] = player
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|location| board[location] == "X"}
      return "X"
    elsif win_combination.all? {|location| board[location] == "O"}
      return "O"
    end
  end
  if won?(board) == false
      return nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) == true
    puts "Congratulations!"
  elsif draw?(board) == true
    puts "The game is a draw!"
  end
  end
