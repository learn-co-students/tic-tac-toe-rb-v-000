
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

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  number_of_turns = 0
  board.each do |i|
    if i != " "
      number_of_turns += 1
    end
  end
  return number_of_turns
end

def current_player(board)
  number_of_turns = turn_count(board)
  if number_of_turns % 2 == 0
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  all_blank = board.all? do |i|
    i == " "
  end
  if all_blank
    return false
  end
  WIN_COMBINATIONS.each do |i|
    if (board[i[0]] == "X" && board[i[1]] == "X" && board[i[2]] == "X") || (board[i[0]] == "O" && board[i[1]] == "O" && board[i[2]] == "O")
      return i
    end  
  end
  return false
end

def full?(board)
  none_blank = board.none? do |i|
    i == " "
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    winner = board[won?(board)[0]]
  end
end

def play(board)
  game_is_over = over?(board)
  until game_is_over
    turn(board)
    game_is_over = over?(board)   
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end















