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


def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
      if index.between?(0,8) && !position_taken?(board, index)
        return true
      else
    end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  current_player = current_player(board)

if valid_move?(board, index)
    current_player(board)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

 def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def position_taken?(board, index)
  board[index] != " "
end


WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], #Top
    [0, 3, 6], [1, 4, 7], [2, 5, 8], #vertical - array 1
    [0, 4, 8], [2, 4, 6], #diagnol - array 2
]




def won?(board)
  WIN_COMBINATIONS.detect do |combinations|
    win_index_1 = combinations[0]
    win_index_2 = combinations[1]
    win_index_3 = combinations[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combinations
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return combinations
       else
        false
       end
         end
      end

def full?(board)
    board.all? do |complete|
      complete != " "
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



def turn_count(board)
 counter = 0
 board.each do |i|
 if i == "X" || i == "O"
 counter += 1
      end
    end
  return counter
 end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
end


end

def play(board)
until over?(board)
   current_player(board)
   turn(board)
 end
   if won?(board)
    puts "Congratulations #{winner(board)}!"
   else
    puts "Cat's Game!"
  end
end
