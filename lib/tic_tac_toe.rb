board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # mdidle column
  [2,5,8], # right column
  [0,4,8], # diagonal left start
  [2,4,6] # diagonal right start
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end


def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  spaces = []
  board.each do |blanks|
    spaces << blanks if blanks == " "
  end
  return 9 - spaces.count
end

def current_player(board)
  if turn_count(board).even?
    current_team = "X"
  elsif turn_count(board).odd?
    current_team = "O"
  end
end

def won?(board)
  status = false
  WIN_COMBINATIONS.each do |combination|
      position_1 = board[combination[0]]
      position_2 = board[combination[1]]
      position_3 = board[combination[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        status = true
        return combination

      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        status = true
        return combination
      end
    end
    return status
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  won?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    winning_team = won?(board)
    winner = winning_team[1]
    team = board[winner]
    return team
  end

end

def play(board)
until over?(board) == true
  turn(board)
end
if draw?(board) == true
  puts "Cats Game!"
else
puts "Congratulations #{winner(board)}!"
end
end
