
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

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

def input_to_index(user_input)
  user_input.to_i - 1
end

def turn_count(board)
  i = 0;
  count = 0;
  9.times do
    if (board[i]=="X" || board[i]=="O")
      count+=1
    end
    i+=1
  end
  return count
end

def current_player(board)
  if (turn_count(board)%2==0)
    return "X"
  else
    return "O"
  end
end


def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, token)
    board[index]=token
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (combo.all?{|pos| position_taken?(board,pos)})
      if (combo.all?{|position| board[position]=="X"})
        return combo
      elsif (combo.all?{|position| board[position]=="O"})
        return combo
      end
    end
  end
  return false
end

def full?(board)
  if board.any?{|pos| pos==" "}
    return false
  end
  return true;
end

def draw?(board)
  full = full?(board)
  if !won?(board)
    return full
  end
end

def over?(board)
  (draw?(board) || won?(board))
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  return nil
end

def turn(board)
  trig = false;
  while (!trig)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
      if valid_move?(board, index)
        if current_player(board)=="X"
          character = "X"
        elsif current_player(board)=="O"
          character = "O"
        end
        move(board, index, character)
        display_board(board)
        trig=true
      end
  end
end


def play(board)
  9.times do
    if !over?(board)
      turn(board)
    end
  end
  if draw?(board)
    puts "Cats Game!"
  elsif (winner(board)=="X" || winner(board)=="O")
    puts "Congratulations "+winner(board)+"!"
  end
end


#### helper methods





# Define your play method below
