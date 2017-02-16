def display_board(arr)
  horizontalLine = "-----------"
  puts " #{arr[0]} | #{arr[1]} | #{arr[2]} "
  puts horizontalLine
  puts " #{arr[3]} | #{arr[4]} | #{arr[5]} "
  puts horizontalLine
  puts " #{arr[6]} | #{arr[7]} | #{arr[8]} "
end

def input_to_index(myInput)
  myInput.to_i - 1
end

def move(myBoard, choice, player)
  myBoard[choice] = player
  myBoard
end

def position_taken? (board, position)
!(board[position] == " " || board[position] == "" || board[position] == nil)
end

def valid_move?(board, index)
 !(position_taken?(board, index) || ((index < 0 || index > 8)))
end

def turn(board)
  #define player
  player = current_player(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if (valid_move?(board, index))
    move(board, index, player)
  else
    turn(board)
  end
  display_board(board)
end

def play(board)
counter = 0
  while (counter < 9)
    turn(board)
    counter += 1
  end
end

def turn_count(board)
  turns_played = 0
  board.each do |item|
    if (item != " " && item != "")
      turns_played += 1
    end
  end
  turns_played
end

def current_player(board)
  if (turn_count(board) % 2 == 0)
    return "X"
  else
    return "O"
  end
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  won = false
  WIN_COMBINATIONS.each do |comboArray|
    position1 = board[comboArray[0]]
    position2 = board[comboArray[1]]
    position3 = board[comboArray[2]]
    if ((position1 == "X" && position2 == "X" && position3 == "X") ||
        (position1 == "O" && position2 == "O" && position3 == "O"))
        return [comboArray[0], comboArray[1], comboArray[2]]
    end
  end
  won
end

def full?(board)
  full = board.none? do |boardValue|
    boardValue == " " || boardValue == ""
  end
  full
end

#true if it's full and not been won

def draw? (board)
  isFull = full?(board)
  isWon = won?(board)
  (isFull && isWon == false)
end

def over? (board)
  if (draw?(board) || won?(board) != false)
    return true
  else
    return false
  end
end

def winner(board)
  answer = nil
  if (won?(board) != false)
    index = won?(board)[0]
    answer = board[index]
  end
  return answer
end

def play(board)
  while (!over?(board))
  turn(board)
end
  if (draw?(board))
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
