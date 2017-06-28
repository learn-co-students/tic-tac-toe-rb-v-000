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

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move( board, input_to_index, players_character )
  board[input_to_index] = players_character
end

def position_taken?(board, index)
if board[index] == "X" || board[index] ==  "O"
true
elsif board[index] == " " || board[index] == "" || board[index] == nil
false
end
 end

 def valid_move?(board, index)
 if position_taken?(board, index) == false && (index).between?(0, 8) == true
    return true
    else false
  end
 end



 

 def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    board
  else valid_move?(board, index) == false
    turn(board)
  end
end





 def turn_count(board)
   count = 0
   board.each do |letter|
     if letter == "X" || letter == "O"
       count += 1
     end
   end
   count
 end

 def current_player (board)
  turn_count(board) % 2 == 0 ? "X" : "O"
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
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?(board)
    if board.detect {|i| i == " " || i == nil}
      return false
    else
      return true
    end
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
  if win_combination = won?(board)
    board[win_combination.first]
    end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if draw?(board) == true
      puts "Cats Game!"
  else puts "Congratulations #{winner(board)}!"
  end
end
