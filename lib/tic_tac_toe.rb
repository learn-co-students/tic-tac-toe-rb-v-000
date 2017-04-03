WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]

def display_board(array)
  puts " #{array[0]} | #{array[1]} | #{array[2]} "
  puts "-----------"
  puts " #{array[3]} | #{array[4]} | #{array[5]} "
  puts "-----------"
  puts " #{array[6]} | #{array[7]} | #{array[8]} "
end

def input_to_index(user_input)
  z = user_input.to_i
  z - 1
end

def move(board, user_input, char)
  board[user_input] = char
end

def position_taken?(board, index)
  !(board[index] != " " || board[index] != "" || board[index] !=  nil) || board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  char = current_player(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, char)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |char|
    if char == "X"
      counter += 1
    end
    if char == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  x = turn_count(board)
  if x.even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
   if WIN_COMBINATIONS.each do |win_combo|
    windex1 = win_combo[0]
    windex2 = win_combo[1]
    windex3 = win_combo[2]

    p1 = board[windex1]
    p2 = board[windex2]
    p3 = board[windex3]
        if p1 == "X" && p2 == "X" && p3 == "X"
          return win_combo
        end
        if p1 == "O" && p2 == "O" && p3 == "O"
          return win_combo
        end
      end
    else
      false
    end
  end

  def full?(board)
     board.all? do |char|
      char == "X" || "O"
      char != " "
      end
  end

  def draw?(board)
    full?(board) && !(won?(board))
  end

  def over?(board)
    full?(board) || draw?(board) || won?(board)
  end

  def winner(board)
    if WIN_COMBINATIONS.each do |win_combo|
     windex1 = win_combo[0]
     windex2 = win_combo[1]
     windex3 = win_combo[2]

     p1 = board[windex1]
     p2 = board[windex2]
     p3 = board[windex3]
         if p1 == "X" && p2 == "X" && p3 == "X"
           return "X"
         end
         if p1 == "O" && p2 == "O" && p3 == "O"
           return "O"
         end
       end
     else
       false
     end
   end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cats Game!"
  end
end
