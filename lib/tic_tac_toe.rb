
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if position_taken?(board, combination[0]) && board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]
      return combination
    end
  end
  false

end

def full?(board)
    board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if draw?(board) || won?(board)
    true
    else
    false
  end

end

def winner(board)
  if won?(board)
  board[won?(board)[0]]
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, char)
  board[position.to_i - 1] = char
end

# code your #valid_move? method here
def valid_move?(board, position)
  pos = position.to_i

  if !pos.between?(1,9) || position_taken?(board, pos - 1)
    false
  else
    true
  end
end

#run a turn
def turn(board)
  puts "Please enter 1-9:"
  position = gets
  if !valid_move?(board, position)
    turn(board)
    else

    move(board, position, current_player(board))
    display_board(board)
  end
end


# how many turns have been played
def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
   return counter
end



# current player
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
    else
    return "O"
  end

end

def play(board)
  until over?(board)
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"

    elsif draw?(board)
      puts "Cats Game!"
  end

end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
    else nil
  end
end




def reset(board)
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end


