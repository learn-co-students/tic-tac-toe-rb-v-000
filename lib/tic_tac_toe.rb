WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6],
]
def display_board(board = ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", " s "])
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board

def input_to_index(user_input)
  user_input.to_i - 1
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8) ? true : false
end

def position_taken?(board, index)
   board[index] == " " || board[index] == "" || board[index] == nil ? false : true
end

def move(board, index, character)
  board[index] = character
end

def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    character = current_player(board)
    if valid_move?(board, index) == false
      turn(board)
    else move(board, index, character)
    end
    display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |board|
    if board == "X" || board == "O"
      counter +=1
  end
end
return counter
end

def current_player(board)
  if turn_count(board)%2 == 0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end

def won?(board)
    WIN_COMBINATIONS.each do |winning_combo|
    if  board[winning_combo[0]] == board[winning_combo[1]] && board[winning_combo[1]] == board[winning_combo[2]] && position_taken?(board, winning_combo[0])
      return winning_combo
    else
      false
    end
  end
  return false
end

def full?(board)
  board.all? {|board_full| board_full == "X" || board_full == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif won?(board)
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
end
