
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && board[combo[0]] != " " && board[combo[0]] != "" && !board[combo[0]].nil?)
      return combo
      break
    end
  end
  return false
end

def full?(board)
  if !(won?(board))
    board.each do |position|
      if (position != "O" && position != "X" )
        return false
      end
    end
  end
  return true
end

def draw?(board)
  if !(won?(board)) && !full?(board)
    return false
  elsif !(won?board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
   winner = won?(board)
   if winner != false
     return board[winner[0]]
   else
     return nil
   end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip()
  valid = false
  while valid == false
    if valid_move?(board, position)
      move(board, position, current_player(board))
      valid = true
    else
      puts "Invalid Move. Please enter 1-9:"
      position = gets.strip()
    end
  end
end

def valid_move?(board, position)
  int = (position.to_i - 1)
  query = board[int]
  if int.between?(0,9) && (query == "" || query ==" " || query == nil)
    true
  else
    false
  end
end

def display_board(board)
  puts(" #{board[0]} | #{board[1]} | #{board[2]} ")
  11.times {print "-"}
  puts ""
  puts(" #{board[3]} | #{board[4]} | #{board[5]} ")
  11.times {print "-"}
  puts ""
  puts(" #{board[6]} | #{board[7]} | #{board[8]} ")
end

def move(board, position, char)
  place = position.to_i - 1
  board[place] = char
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position != "" && position != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn = turn_count(board)
  if turn.even?
    return "X"
  else
    return "O"
  end
end

def play(board)
  while !(over?(board))
    display_board(board)
    turn(board)
  end
    if won?(board) != false
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cats Game!"
    end
  end
