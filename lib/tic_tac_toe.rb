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

def move(board, index, current_player = "X" )
  board[index] != " "
    board[index] = current_player

  end

  def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil # safety measures
        taken = false
      elsif board[index] == "X" || board[index] == "O"
        taken = true
    end
  end

  def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)
      return true
    else
     return false

    end
  end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end




def turn_count(board)
  count = 0
  board.each do |index|
    if index != " "
      count += 1
    end
  end
    count
 end

def current_player(board)
  if turn_count(board) % 2 == 0
     return "X"
   else
     return "O"
   end
 end

 WIN_COMBINATIONS = [
   [0,1,2],  # Top row
   [3,4,5],  # Middle row
   [6,7,8],  # Bottom row
   [0,4,8],  # Left diagonal
   [6,4,2],  # Right diagonal
   [0,3,6],  # Right vertical
   [1,4,7],  # Middle vertical
   [2,5,8]   # Right vertical
 ]

 def won?(board)
  WIN_COMBINATIONS .each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
          return combination
        end
        if board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
              return combination
  end
end
false
end

def full?(board)
board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
won?(board) || draw?(board)

end

def winner(board)
  if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end

def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations player #{winner}!"
    end
    if draw?
      puts "Draw!"
    end
  end
