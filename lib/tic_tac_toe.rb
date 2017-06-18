WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [8,4,0]
  ]


def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(users_input)
 users_input.to_i - 1
end


def move(board, index, character)
  board[index] = character
end



def position_taken?(board, index)
 if board[index] == " " || board[index] == "" || board[index] == nil
   false
 elsif board[index] == "X" || "O"
   true
   end
end


def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  end
end


def turn(board)
  puts "Please enter 1-9:"
  users_input = gets.strip
  index = input_to_index(users_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else valid_move?(board, index)
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    end
  end
   counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end


def won?(board)
WIN_COMBINATIONS.each do |win_combination|
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
  false
end


def full?(board)
  board.all? do |i|
    i != " "
  end
end


def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end


def over?(board)
  if draw?(board) || won?(board)
    true
  end
end


def winner(board)
  if !won?(board)
return nil
  elsif (board[won?(board)[0]] == "X")
return "X"
  elsif (board[won?(board)[0]] == "O")
return "O"
 end
end


def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "congratulations #{winner}!"
  end

  if draw?(board)
    puts "Cats Game!"
  end
 end
