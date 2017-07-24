WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def input_to_index(user_input)
  user_input.to_i - 1
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, index, character)
  board[index] = character
  board
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index] == " " || board[index] == "" || board[index] == nil)
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |location|
    if (location == "X" || location == "O")
      turns += 1
    end
  end
  turns
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  end
  if draw?(board)
    puts "Cats Game!"
  end
end

def won?(board)
  won = nil
  WIN_COMBINATIONS.each do |win_combo|
    row = []
    win_combo.each do |position|
      if position_taken?(board,position)
        row << board[position]
      end
    end
    if (row.length == 3 && (!row.include?("X") || !row.include?("O")))
      won = win_combo
    end
  end
  won
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  won = won?(board)
  if won
    board[won[0]]
  else
    won
  end
end
