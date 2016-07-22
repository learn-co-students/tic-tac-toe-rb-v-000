WIN_COMBINATIONS = [
top_row_win = [0, 1, 2],
middle_row_win = [3, 4, 5],
bottoom_row_win = [6, 7, 8],
first_vertical_win = [0, 3, 6],
second_vertical_win = [1, 4, 7],
third_vertical_win = [2, 5, 8],
top_right_win = [0, 4, 8],
top_left_win = [2, 4, 6 ]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def move(board, position, value = "X")
  board[position.to_i - 1] = value
end


def position_taken?(board, position)
  !(board[position.to_i].nil? || board[position.to_i] == " ")
end


def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end




def turn(board)
  puts "Please enter 1-9:"
  position=gets.chomp
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter=0
  board.each do |which_player|
    if which_player == "X" || which_player == "O"
      counter += 1
    end
  end
  counter
end


def current_player(board)
  turn_count(board).even? ? "X" : "O"
end


def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

 board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] &&  board[win_index_1] != " "
 end
 end


def full?(board)
  board.none? { |position| position == " "  }
end


def draw?(board)
  full?(board) && !won?(board)
end



def over?(board)
  won?(board) || draw?(board)
end



def winner(board)
  win_combination = won?(board)
  if win_combination
  winning = win_combination[0]
  board[winning]

end
end


def play(board)
  until over?(board)
      turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
