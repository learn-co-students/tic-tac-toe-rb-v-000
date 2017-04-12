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

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if (board[index] == " ")
    return false
  elsif (board[index] == "")
    return false
  elsif (board[index] == "X")
    return true
  elsif (board[index] == "O")
    return true
  else
    return false
  end
end

def turn(board)
  index =10
  while (index <0 or index >9)
  puts "Please enter 1-9:"
  user_input = gets.strip

  index = input_to_index(user_input)
  end

  if valid_move?(board,index)== true
    move(board, index,current_player(board))
    display_board(board)
    if draw?(board)== true
      puts "Cats Game!"
    elsif winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    end
    return index
  end
  index = 10
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn_count(board)
  counter = 0
  board.each do |place|
    if (place == "X")
      character= "X"
      counter+=1
    elsif (place == "O")
      character = "O"
      counter+=1
    end
  end
  return counter
end


def current_player(board)
    player = "X"
  if (turn_count(board) == 1)
    player ="O"
  elsif (turn_count(board) % 2==0)
    player= "X"
  else
    player ="O"
  end
  return player
end

WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[0]
  position_2 = board[1]
  position_3 = board[2]
  position_4 = board[3]
  position_5 = board[4]
  position_6 = board[5]
  position_7 = board[6]
  position_8 = board[7]
  position_9 = board[8]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winner = "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winner = "O"
      return win_combination
    elsif position_4 == "X" && position_5 == "X" && position_6 == "X"
      winner = "X"
      return WIN_COMBINATIONS[1]
    elsif position_4 == "O" && position_5 == "O" && position_6 == "O"
      winner = "O"
      return WIN_COMBINATIONS[1]
    elsif position_7 == "X" && position_8 == "X" && position_9 == "X"
      winner = "X"
      return WIN_COMBINATIONS[2]
    elsif position_7 == "O" && position_8 == "O" && position_9 == "O"
      winner = "O"
      return WIN_COMBINATIONS[2]

    elsif position_1 == "X" && position_4 == "X" && position_7 == "X"
      winner = "X"
      return WIN_COMBINATIONS[3]
    elsif position_1 == "O" && position_4 == "O" && position_7 == "O"
      winner = "O"
      return WIN_COMBINATIONS[3]
    elsif position_2 == "X" && position_5 == "X" && position_8 == "X"
      winner = "X"
      return WIN_COMBINATIONS[4]
    elsif position_2 == "O" && position_5 == "O" && position_8 == "O"
      winner = "O"
      return WIN_COMBINATIONS[4]
    elsif position_3 == "X" && position_6 == "X" && position_9 == "X"
      winner = "X"
      return WIN_COMBINATIONS[5]
    elsif position_3 == "O" && position_6 == "O" && position_9 == "O"
      winner = "O"
      return WIN_COMBINATIONS[5]

    elsif position_1 == "X" && position_5 == "X" && position_9 == "X"
      winner = "X"
      return WIN_COMBINATIONS[6]
    elsif position_1 == "O" && position_5 == "O" && position_9 == "O"
      winner = "O"
      return WIN_COMBINATIONS[6]
    elsif position_7 == "X" && position_5 == "X" && position_3 == "X"
      winner = "X"
      return WIN_COMBINATIONS[7]
    elsif position_7 == "O" && position_5 == "O" && position_3 == "O"
      winner = "O"
      return WIN_COMBINATIONS[7]
    else
      return false
    end
  end
end

def full?(board)
  if board.none?{|moves| moves ==" "} == true
    return true
  else
    return false
  end
end

def draw?(board)
  won?(board)
  if full?(board) == true && won?(board)== false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false or board.none?{|moves| moves ==" "} == true
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

  position_1 = board[0]
  position_2 = board[1]
  position_3 = board[2]
  position_4 = board[3]
  position_5 = board[4]
  position_6 = board[5]
  position_7 = board[6]
  position_8 = board[7]
  position_9 = board[8]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    elsif position_4 == "X" && position_5 == "X" && position_6 == "X"
      return "X"
    elsif position_4 == "O" && position_5 == "O" && position_6 == "O"
      return "O"
    elsif position_7 == "X" && position_8 == "X" && position_9 == "X"
      return "X"
    elsif position_7 == "O" && position_8 == "O" && position_9 == "O"
      return "O"
    elsif position_1 == "X" && position_4 == "X" && position_7 == "X"
      return "X"
    elsif position_1 == "O" && position_4 == "O" && position_7 == "O"
      return "O"
    elsif position_2 == "X" && position_5 == "X" && position_8 == "X"
      return "X"
    elsif position_2 == "O" && position_5 == "O" && position_8 == "O"
      return"O"
    elsif position_3 == "X" && position_6 == "X" && position_9 == "X"
      return"X"
    elsif position_3 == "O" && position_6 == "O" && position_9 == "O"
      return "O"
    elsif position_1 == "X" && position_5 == "X" && position_9 == "X"
      return "X"
    elsif position_1 == "O" && position_5 == "O" && position_9 == "O"
      return "O"
    elsif position_7 == "X" && position_5 == "X" && position_3 == "X"
      return "X"
    elsif position_7 == "O" && position_5 == "O" && position_3 == "O"
      return "O"
    else
      return nil
    end
  end
end


def play(board)
  count = 0
  until over?(board) == true || count >9
    count =+1
    turn(board)
  
  end
end
