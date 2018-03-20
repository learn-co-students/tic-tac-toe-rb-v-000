WIN_COMBINATIONS =[
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column
  [2, 5, 8], #Right column
  [0, 4, 8], #Left across
  [6, 4, 2], #Right across
]

def display_board (board)
    puts " #{board[0]} " "| #{board[1]} |" " #{board[2]} "
    puts "-----------"
    puts " #{board[3]} " "| #{board[4]} |" " #{board[5]} "
    puts "-----------"
    puts " #{board[6]} " "| #{board[7]} |" " #{board[8]} "
end

def input_to_index (user_input)
    user_input.to_i - 1
end

def move (board, user_input, value)
  board[user_input] = value
end

def position_taken? (board, index)
  if board[index] == "" || board[index] == " " || board[index]== nil
    return false
  else
    return true
  end
  end

def valid_move? (board, index)
  index.between?(0,8) && !position_taken?(board, index)
  end


def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.strip
    input = input_to_index(user_input)
      if valid_move?(board,input)
        move(board, input, current_player(board))
      else
        turn(board)
      end
  display_board(board)
end



def turn_count(board)
  turn = 0
    board.each do |token|
      if token == "X" || token == "O"
        turn+=1
      else
    end
  end
  turn
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
won?(board) || draw?(board)
end

def winner(board)
   if winning_combo = won?(board)
     board[winning_combo.first]
   end
 end

 def play(board)
   until over?(board)
     turn(board)
   end
    if draw?(board)
      puts "Cat\'s Game!"

    else won?(board)
    puts "Congratulations #{winner(board)}!"
    end
 end
