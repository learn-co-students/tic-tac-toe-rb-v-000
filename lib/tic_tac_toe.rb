require 'pry'

WIN_COMBINATIONS=[
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
  index=user_input.to_i-1
  return index
end

def move(board, index, character)
  board[index]=character
end

def position_taken?(board, index)
    if board[index] ==" "
      return false
    else
      return true
    end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index)==false
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please choose a square 1-9"
  input = gets.strip
  index=input_to_index(input)
    if index.even?
      character="X"
    else
      character="O"
    end
    # binding.pry
  if valid_move?(board, index)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns=0
  # binding.pry
  board.each_with_index do |square, index|
    if board[index]=="X" || board[index]=="O"
      turns+=1
    end
  end
  return turns
end

def current_player(board)
  if turn_count(board).even?
    player="X"
  else
    player="O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    position_1=board[win_index_1]
    position_2=board[win_index_2]
    position_3=board[win_index_3]

    if position_1==position_2 && position_2==position_3 && position_1 !=" "
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.each_with_index do |item, index|
    if position_taken?(board, index)==false
      return false
    end
  end
  return true
end

def draw?(board)
  # if won?(board)==false && full?(board)==true
  #   return true
  # elsif won?(board)==false && full?(board)==false
  #   return false
  # elsif won?(board)==true
  #   return false
  # end
  won=won?(board)
  full=full?(board)
  # binding.pry
  if won==false && full==true
    return true
  elsif won==false && full==false
    return false
  elsif won==true
    return false
  else
    return false
  end
end

def over?(board)
  if won?(board) ==true || draw?(board)==true||full?(board)==true
    return true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
