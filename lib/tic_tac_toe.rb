WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

# Helper Methods
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

def move(board, index, player)
  board[index] = player
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

      player = current_player(board)
      move(board, index, player)
      display_board(board)
    else
      turn(board)
    end
end


def turn_count(board)
  board.count{|el| el != " " && el != "" && el != nil}
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)

#WIN_COMBINATIONS.find do |el|
  #board[el[0]] == board[el[1]] && board[el[1]] == board[el[2]] && board[el[0]] != " "
#end

WIN_COMBINATIONS.each do |el| #[0, 1 ,2]

  win_position_1 = el[0]
  win_position_2 = el[1]
  win_position_3 = el[2]

    if board[win_position_1] == "X" && board[win_position_2] == "X" && board[win_position_3] == "X"
      return el
    elsif board[win_position_1] == "O" && board[win_position_2] == "O" && board[win_position_3] == "O"
      return el
    end
  end
  false
end

def full?(board)
  board.none?{|el| el == " " || el == "" || el == nil}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  end
end

def over?(board)
  if full?(board) == true || won?(board) != false || draw?(board) == true
    true
  end
end

def winner(board)
  if won?(board) != false
    (board[won?(board)[0]])
  end
end

# # Define your play method below
def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end
end
