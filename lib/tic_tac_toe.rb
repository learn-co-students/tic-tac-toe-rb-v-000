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

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def turn_count(board) #counts occupied positions
  count = board.find_all{|values| values == "X" || values == "O" }
  count.size
end


def current_player(board)
    if turn_count(board).even?
                "X"
        else
          "O"
        end
end


def won?(board)
    winning_combination=[]
    WIN_COMBINATIONS.each do |win_option|
    win_index_1 = win_option[0]
    win_index_2 = win_option[1]
    win_index_3 = win_option[2]
    win_option[0]
    if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
      winning_combination = [win_index_1, win_index_2, win_index_3]
      winning_combination
    elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
        winning_combination = [win_index_1, win_index_2, win_index_3]
        winning_combination
    else
      false
    end
  end
  if winning_combination != []
    winning_combination
  else false
  end
end

def full?(board)
  !board.include?(nil) && !board.include?(" ") && !board.include?("")
end

def draw?(board)
  if won?(board) != false #board is won
    false
  elsif full?board
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board) == false
    nil
  else
    board[won?(board)[0]]
  end
end

def play(board)
  while !over?(board)
    turn(board)
    turn_count(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
