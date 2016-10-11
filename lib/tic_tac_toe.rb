WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left columns
  [1,4,7], #middle columns
  [2,5,8], #right columns
  [0,4,8], #diagonal 1
  [2,4,6] #diagonal 2
]

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, character)

  board[index] = character
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    character = current_player(board)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |count|
    if count != " "
      counter += 1
    end
  end
  return counter
end

def current_player(board)
counter = turn_count(board)
  turn_count(board)
  if counter.even? == true
    return "X"
  elsif counter == 0
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8) == true
    return true
  else
    return false
  end
end



def won?(board)
    if WIN_COMBINATIONS.detect do |win_combination|
		    if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && board[win_combination[0]] != " "
          return win_combination
        end
    end
    else
      false
    end
end

def full?(board)
  board.all? do |position|
    position != " "
  end
end

def draw?(board)
  !won?(board) && full?(board)
end



def over?(board)
  won?(board) != false || draw?(board) == true
end

def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && board[win_combination[0]] != " "
      return board[win_combination[0]]
    else
      nil
    end
  end
end




def play(board)
  until over?(board) == true
  turn(board)
  end
  if won?(board) != false
    character = current_player(board)
    puts "Congratulations #{character}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
