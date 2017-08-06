WIN_COMBINATIONS =[
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #1st column
    [1,4,7], #2nd column
    [2,5,8], #3rd column
    [0,4,8], #diagonal lfttp to btmrght
    [6,4,2] #diagonal btmlft to top right
  ]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


# Define your WIN_COMBINATIONS constant
def input_to_index(user_input)
  user_input.to_i-1
end

def move(board,position,playertoken)
  board[position]=playertoken
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  !position_taken?(board,index) && index.between?(0,9)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
    turnsmade = (board -[" "])
    turnsmade.length
end

def current_player(board)
    if turn_count(board).even?
      "X"
    else
      "O"
    end
end

def won?(board)
    WIN_COMBINATIONS.detect do |winarray|
          if board[winarray[0]] == "X" && board[winarray[1]] == "X" && board[winarray[2]] == "X"
            winarray.to_a

          elsif  board[winarray[0]] == "O" && board[winarray[1]] == "O" && board[winarray[2]] == "O"
            winarray.to_a
          else
           false
          end
        end
end

def full?(board)
    # won?(board) || !board.include?(" ")
    turn_count(board) == 9
end


def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
    won?(board) || draw?(board)
end

def winner(board)
    if won?(board) == nil
      nil
    else
     board[won?(board)[0]]
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
