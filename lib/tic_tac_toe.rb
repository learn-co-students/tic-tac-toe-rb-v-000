# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "" )
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  WIN_COMBINATIONS.any? do |combo|
    position0 = board[combo[0]]
    position1 = board[combo[1]]
    position2 = board[combo[2]]
      if (position0 == "X" && position1 == "X" && position2 == "X") || (position0 == "O" && position1 == "O" && position2 == "O") 
        return combo

      else
        false
      end

  end
end

def full?(board)
  board.all? do |position|
    if position == "X" || position == "O"
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
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end  

def winner(board)
  if !won?(board)
    return nil
  else 
    return board[won?(board)[0]]
  end  
  


end  

def display_board (board)
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end  

def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
end

def move(board, input, value)
  # turn = input.to_i 
  board[input] = value
  return board
end

def valid_move?(board, position)
  # position = position.to_i - 1
  if 
    position <0 || position >8
    false
  elsif position_taken?(board, position) == false
    true
  elsif
    position_taken?(board, position) == true
    false
  else
    false
  end
  
end  

def turn(board)
  puts "Please enter 1-9:"
  num_input = gets
  position = input_to_index(num_input)
  if valid_move?(board,position) == false

 turn(board)
  else
   move(board, position, current_player(board))
   display_board(board)

  end
  
end

def turn_count(board)
  counter = 0
  board.each do |position|
      if position == "O" || position == "X"
        counter += 1
      else 
        counter = counter
      end
    end
return counter
  
end

def current_player(board)
  if turn_count(board) % 2 ==0
    then "X"
  else
    "O"
  end
end


# really re-worked
def play(board)

  until over?(board) 
     turn(board)
  end
  
     
if won?(board)
   puts  "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cats Game!"
end


end
