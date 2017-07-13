WIN_COMBINATIONS =
[
  [0,1,2], # Top row
  [3,4,5],  # Midlle row
  [6,7,8], # last row

  [0,3,6], # left column
  [1,4,7], # Midlle column
  [2,5,8], # right column
  [0,4,8], # Midlle to the right
  [2,4,6], # Midlle to the left
]

def display_board(position=[" "," "," "," "," "," "," "," "," "])
  puts " #{position[0]} | #{position[1]} | #{position[2]} "
  puts "-----------"
  puts " #{position[3]} | #{position[4]} | #{position[5]} "
  puts "-----------"
  puts " #{position[6]} | #{position[7]} | #{position[8]} "
end

def input_to_index(user_input)
  input= user_input.to_i
  input=input -1
end

def move(board,index,char)
    board[index] = char
end

def position_taken?(board,index)
 if( (board[index]=="")|| (board[index]==" ")|| (board[index]== nil))
      return false
   else
       return true
   end
end

def valid_move?(board,index)
  if (index<0 || index>8)
     return false
  else
   return !position_taken?(board,index)
 end
end

def current_player(board)
  val_count=turn_count(board)
    if (val_count%2==0)
        return "X"
    else
        return "O"
    end
end

def turn_count(board)
  val_count=0
  board.each do |space|
        if (!(space=="" || space==" ")  )
          val_count+=1
        end
   end
   val_count
end
def aski_for_input
  puts "Please enter 1-9:"
  input=gets.strip()
  index=input_to_index(input)
end
def turn(board)
   index=aski_for_input()
  if (valid_move?(board,index))
     move(board,index,current_player(board))
     display_board(board)
   else
      turn(board)
  end
end


def won?(board)
  won= WIN_COMBINATIONS.each do |win_combo|
    if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
    return win_combo
  elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
     return win_combo
    end
  end
    return false
end

def full?(board)
  board.none? { |e| e==" " }
end



def draw?(board)
  (!won?(board) && full?(board))
end

def over?(board)
   if won?(board)
      true
   else
      full?(board)
    end
end

def winner(board)
    combi=won?(board)
  if (won?(board))
      return board[combi[0]]
  else

  end
end

def play(board)

  until (over?(board))
    turn(board)
    if draw?(board)
      break
    end

  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
 elsif (draw?(board))
   puts "Cats Game!"
 end

end
