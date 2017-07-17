WIN_COMBINATIONS =[
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

def input_to_index(index)
  index = index.to_i
  index -1
end

def move (board, index, symbol)
    board[index]=symbol
end

def position_taken?(board, index)
  if board [index] == " " || board[index] =="" || board[index] == nil
    false
  elsif board [index] =="X" || board[index] == "O"
    true
  end
end

def valid_move? (board,index)
  if !position_taken?(board,index) && index.between?(0,8)
    true
  else
    false
  end
end

def turn(board)
 puts "Please enter 1-9:"
 index = gets.strip
 index=input_to_index(index)
 if valid_move?(board, index)
   move(board, index, current_player(board))
   display_board(board)
else
  turn(board)
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
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
  if board.all? {|element| element =="X" || element=="O"}
    true
  else
    false
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if winning_Combination = won?(board)
    board[winning_Combination.first]
  end
end

def turn_count (board)
counter = 0
  board.each do |board|
    if board == "X" || board == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return"O"
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
else
puts "Cats Game!"
end
end
