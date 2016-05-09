WIN_COMBINATIONS = [
  [0,1,2],  #0
  [3,4,5],  #1
  [6,7,8],  #2
  [0,3,6],  #3
  [1,4,7],  #4
  [2,5,8],  #5
  [0,4,8],  #6
  [2,4,6]   #7
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def move(board, input, char)# code your move method here!
  board[input.to_i - 1] = char  # board[] has the character X
end


def position_taken?(board, position)
  if board[position] == "" || board[position] == " "
    false
  elsif board[position] == nil
    false
  elsif board[position] == "X" || board[position] == "O"
    true
  end
end


def valid_move?(board, position)
  if (position.to_i.between?(1, 9) == true) && (position_taken?(board, position.to_i - 1) == true)
    false
  elsif (position.to_i.between?(1, 9) == false) || (position_taken?(board, position.to_i - 1) == true)
    false
  elsif (position.to_i.between?(1, 9) == true) && (position_taken?(board, position.to_i - 1) == false)
    true
  end
end


def turn_count(board)
  counter = 0
  board.each do |character|
    if (character == "X") || (character == "O")
    counter += 1
    end
  end
  counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  elsif turn_count(board) == 1
    "O"
  elsif turn_count(board) == 0
    "X"
  elsif turn_count(board) % 2 != 0
    "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |combo|

    position1 = board[combo[0]]
    position2 = board[combo[1]]
    position3 = board[combo[2]]

    if ((position1 == "X") && (position2 == "X") && (position3 == "X")) ||
       ((position1 == "O") && (position2 == "O") && (position3 == "O"))

       return [combo[0], combo[1], combo[2]]
    end
  end
  false
end


def full?(board)
  board.all? do |char|
    if (char == "X") || (char == "O")
      true
    else
      false
    end
  end
end


def draw?(board)
  if (won?(board) == true)
    false
  elsif (full?(board) == true) && (won?(board) == false)
    true
  else
    false
  end
end


def over?(board)
  if (won?(board) == true) || (draw?(board) == true) || (full?(board) == true)
    true
  else
    false
  end
end


def winner(board)
  WIN_COMBINATIONS.each do |combo|
    if combo == won?(board)
      return board[combo[0]]
    end
  end
  nil
end


def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def play(board)
  until (over?(board)) || (won?(board))
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cats Game!"
    end
  
end
