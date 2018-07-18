def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
  ]
 
def display_board(board)
  first_row = " #{board[0]} | #{board[1]} | #{board[2]} "
  second_row = " #{board[3]} | #{board[4]} | #{board[5]} "
  third_row = " #{board[6]} | #{board[7]} | #{board[8]} "
  row_divider = "-----------"
  puts first_row
  puts row_divider
  puts second_row
  puts row_divider
  puts third_row
end

def input_to_index(user_input)
  index = user_input.to_i - 1
  return index
end

def move(board, index, character)
  board[index] = character
end

def valid_move?(board,index)
  (index >= 0) && (index <= board.length - 1) && (position_taken?(board,index) == FALSE)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index) == FALSE
    puts "invalid"
    turn(board)
  end
  current_mark = current_player(board)
  move(board, index, current_mark)
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |cell|
    if cell== "X" || cell=="O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  number_turns = turn_count(board)
  current_mark = number_turns %2 ==0? "X":"O"
  return current_mark
end
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board,win_index_1) == TRUE
      return win_combination
    else
      false
    end
    #[position_1,position_2,position_3].all? {|position| position == "X"}
    #[position_1,position_2,position_3].all? {|position| position == "O"}
  end
  return false
end

def full?(board)
  board.all? do |slot| 
    slot == "X" or slot == "O"
  end
end


def draw?(board)
  full?(board) == TRUE && won?(board) == FALSE
end

def over?(board)
  draw?(board) == TRUE || full?(board) == TRUE || won?(board) != FALSE
end


def winner(board)
  if over?(board) == TRUE
    win_combination = won?(board)
    winning_position_1 = win_combination[0]
    winning_mark = board[winning_position_1]
  end
end

def play(board)
  until over?(board) == TRUE
    turn(board)
  end
  if won?(board) != FALSE
    winning_mark = winner(board)
    puts "Congratulations #{winning_mark}!"
  elsif draw?(board) == TRUE
    puts "Cat's Game!"
  end
end

#board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
#puts play(board)