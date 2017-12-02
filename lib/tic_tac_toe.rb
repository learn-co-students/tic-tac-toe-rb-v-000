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
  user_input.to_i - 1
end


def move(board, position, token)
  board[position] = token
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board, index)
if index.between?(0, 8) && position_taken?(board, index) == false
true
end
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
board.count do |cell|
  cell == "X" || cell == "O"
end
end

def current_player(board)
  turn_count(board).even? ? "X":"O"
end


def won?(board)
WIN_COMBINATIONS.detect do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
      else
      false
    end
  end
end


def full?(board)
 if board.any? {|i| i == " "}
   false
 else
   true
 end
end


def draw?(board)
 full?(board) && !won?(board)
end


def over?(board)
  draw?(board) || won?(board)
end


def winner(board)
if won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
      return board[combo[0]]
    end
  end
end
end


def play(board)
  until over?(board)
    turn(board)
   end
   if draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
    if winner(board) == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  end
end
