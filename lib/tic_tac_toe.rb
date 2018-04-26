def display_board(board)
  print " #{board[0]} | #{board[1]} | #{board[2]} \n"
  print "-----------\n"
  print " #{board[3]} | #{board[4]} | #{board[5]} \n"  
  print "-----------\n"
  print " #{board[6]} | #{board[7]} | #{board[8]} \n"  
end

def valid_move?(board, index)
  if (board[index] == "X" || board[index] == "O" || index > 8 || index < 0 || position_taken?(board, index))
    return false
  else
    return true
  end
end

def move(board, index, value)
  if (valid_move?(board, index))
    board[index] = value
  end
end

def input_to_index(number)
  number.to_i-1
end

def turn_count(board)
  count = 0
  board.each do |turn|
    if (turn == "X" || turn == "O")
      count += 1
    end
  end
  return count
end

def current_player(board)
  count = turn_count(board)
  return ((count % 2) == 0 || (count == 0)) ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  num = input_to_index(gets.strip)
  if (num < 9 && num >= 0)
      move(board, num, current_player(board))
      display_board(board)
  else turn(board)
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [1,4,7],
  [0,3,6],
  [2,5,8]
  ]
def won?(board)
  WIN_COMBINATIONS.each do|combination|
    win_index1 = combination[0]
    win_index2 = combination[1]
    win_index3 = combination[2]

    position1 = board[win_index1]
    position2 = board[win_index2]
    position3 = board[win_index3]
    
    if (position1 == "X" && position2 == "X" && position3 == "X") ||
       (position1 == "O" && position2 == "O" && position3 == "O")
      return combination
    end
  end
  return false
end

def full?(board) 
  board.all? {|element| element == "X" || element == "O"}
end
  
def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  return (won?(board) || draw?(board))
end

def winner(board)
  if won?(board)
     won?(board).all? do |position|
      if board[position] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
end

def play(board)
  while (!over?(board))
   display_board(board)
   turn(board)
   play(board)
 end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 elsif draw?(board)
   puts "Cat's Game!"
 end
end
