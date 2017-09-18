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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input .to_i - 1
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else  board[index] == " " || ""
    false
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  index = gets.strip
  index = input_to_index(index)
  until valid_move?(board, index)
    puts "Please enter 1-9:"
    index = gets.strip
    index = input_to_index(index)
  end
  move(board, index, current_player(board))
  display_board(board)
  # if valid_move?(board, index)
  #     move(board, index, current_player(board))
  #     display_board(board)
  # else
end

def turn_count(board)
  board.count  {|token| token == "X" || token == "O"}
  end
  # keep in mind desired return value of the #turn_count method
  # is the number of turns that have been played


def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board) #board = ["O", "O", "O", "X", " ", " ", " ", " ", " ", " "]

    WIN_COMBINATIONS.each do |win_combo| #win_combo = [3, 4, 5]
    position_1 = board[win_combo[0]]  # "X"
    position_2 = board[win_combo[1]]  # " "
    position_3 = board[win_combo[2]]  # " "

    #if all three position variables above are "O" or are "X"
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
      end
    end
    false
  end

  def full?(board)
    board.all? do |token|
        token == "X" || token == "O"
    end
  end

  def draw?(board)
    full?(board) && !won?(board)

  end

  def over?(board)
    draw?(board) || won?(board)

  end

  def winner(board)
    if winning_combo = won?(board)
       board[winning_combo.first]
    end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it has been a draw
# end
end
