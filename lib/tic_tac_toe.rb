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

def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

def input_to_index(index)
 return index.to_i - 1
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board,index)
  if board[index] == "" || board[index] == ""
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  else return false
  end
end

def valid_move?(board,index)
  if (index).between?(0,8) && !position_taken?(board,index)
    return true
  elsif position_taken?(board,index)
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |item|
    if item != " " && item != ""
      count += 1
    end
  end
  return count
end

def current_player(board)
  turn_count(board).even? ? "X":"O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_taken?(board,win_index_1) && position_taken?(board,win_index_2) && position_taken?(board,win_index_3)
      if  position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  end
  return false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if !won?(board)
    if full?(board)
      return true
    else
      return false
    end
  else
    return false
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  elsif full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    combi = won?(board)
    return board[combi[0]]
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    char = winner(board)
    puts "Congratulations #{char}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
