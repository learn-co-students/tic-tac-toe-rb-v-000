def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS= [
[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def input_to_index(input)
  input.to_i-1

end

def move(board,index,choice)
board[index]=choice

end

# code your #position_taken? method here!
def position_taken?(board,index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false

  elsif board[index] == nil
    false
  else board[index] == "X"||"O"
    true
  end
end


# code your #valid_move? method here
def valid_move?(board, index)
  if !position_taken?(board,index) && index.to_i.between?(0,8)
    true
  elsif position_taken?(board,index) && !index.to_i.between?(0,8)


  end

end

def turn(board)

  puts "Please enter 1-9:"
  input= gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
    else
    turn(board)
  end

end


def turn_count(board)
    counter = 0
board.each do|player|

  if player == "X"
    counter += 1
  elsif player == "O"
    counter +=1

  end

  end
counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    board = "X"
  else
  board= "O"
  end
end

def won?(board)

    if WIN_COMBINATIONS.each do |win|
          if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
            return win
          elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
            return win
          end
      end
    else
      false
    end
  end

def full?(board)
  board.all? do |brd|
  if   brd == "X" || brd == "O"
      true
  else
  false
  end
end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end

end

def winner(board)
  win = won?(board)
  if win == nil
    nil
  elsif board[win[0]] == "X"
     "X"
  elsif board[win[0]] == "O"
    "O"

  end

end

def play(board)
  until over?(board)
    turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts  "Cats Game!"
    end
end
