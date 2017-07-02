
WIN_COMBINATIONS = [
  [0,1,2],    #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #negative diagonal
  [2,4,6], #positive diagonal
  [0,3,6],   #left column
  [1,4,7], #middle column
  [2,5,8]   #right column
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = "#{input}".to_i - 1
  return index
end

def move(board, index, value)
  board[index] = value
  puts board
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if position_taken?(board, index) == false && valid_move?(board, index) == true
    move(board, index, value="X")
  else
    "Please try again"
    input = gets.strip
  end
  display_board(board)
end

def turn_count(board)
  turns = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      turns += 1
    end
  end
  turns
end

def current_player(board)
  return turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.select do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O")
         return combination
    end
  end
  return false
end

def full?(board)
  board.none?{|i| (i != "X" && i != "O")}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  win_combination = won?(board)
  if won?(board)
    return board[win_combination[0]]
  else
    return nil
  end
end

def play(board)
  until over?(board)
    turn(board)
      if won?(board)
        puts "Congratulations #{winner(board)}!"
      else
        puts "Cats Game!"
      end
  end
end
