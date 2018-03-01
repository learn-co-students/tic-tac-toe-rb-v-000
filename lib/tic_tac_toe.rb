
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

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "O" || position == "X"
      counter += 1
    end
  end
  return counter
  end

  def current_player(board)
    turn_count(board).odd? == true ? "O" : "X"
  end

def current_player(board)
  turn_count(board).odd? == true ? "O" : "X"
end

def turn(board)
  puts "Please enter 1-9:"
  input=gets.strip
  index=input_to_index(input)
  until valid_move?(board, index) == true
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
  character = current_player(board)
  move(board,index,character)
  display_board(board)
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if
      win_combination.all? do |win_index|
        board[win_index] == "X"
      end
      true
    elsif
      win_combination.all? do |win_index|
        board[win_index] == "O"
      end
      true
    else
      false
    end
  end
end

def full?(board)
  if board.detect {|i| i == " " || i == nil}
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
   if !(won?(board))
     return nil
   elsif board[won?(board)[0]] == "X"
     return "X"
   else board[won?(board)[0]] == "O"
     return "O"
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board)!= nil
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
  won?(board)
  won?(board)
end
