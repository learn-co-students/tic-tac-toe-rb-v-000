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
  puts " #{board[0]} | #{board[1]} | #{board[2]} \n"
  puts "-----------\n"
  puts " #{board[3]} | #{board[4]} | #{board[5]} \n"
  puts "-----------\n"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i-1
  return index
end

def move(board,index,token)
  board[index]=token
end

def position_taken?(board,index)
  if board[index]!=" "
    return true
  else
    return false
  end
end

def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  end
end

def turn(board)
  puts "Please enter a number between 1-9"
  user_input=gets.strip
  index = input_to_index(user_input)
    if current_player(board) == "X"
      token = "X"
    elsif current_player(board) == "O"
      token = "O"
  end
    if valid_move?(board,index)
    move(board,index,token)
    display_board(board)
    else
      turn(board)
  end
end

def turn_count(board)
  counter=0
  board.each do |board_loop|
    if board_loop == "X" || board_loop == "O"
    counter+=1
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
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board,combo[0]) &&\
       board[combo[0]]==board[combo[1]] &&\
       board[combo[1]]==board[combo[2]]
      return combo
    end
  end
  nil
end

def full?(board)
  if board.none? {|spaces|spaces==" "}
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    combo = won?(board)
    winner = combo[0]
    return board[winner]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  puts "Congratulations #{winner(board)}!"
  if draw?(board)
    puts "Cats Game!"
  end
end
