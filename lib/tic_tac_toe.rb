def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end

def turn(board)
  turn_count(board) == 0 ? player_token = "X" : player_token = current_player(board)
  puts "Player #{player_token}, it is your turn."
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board, index)
    puts "#{input} is not a possible, pick another space!"
    turn(board)
  #else
  end
  move(board, index, player_token)
  display_board(board)
end

def turn_count(board)
   board.count{|occupied| occupied != " "}
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def move(board, index, current_player)
  board[index] = current_player
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def draw?(board)
  !won?(board) && full?(board)
end

def full?(board)
  !board.any?{|i| i == " "}
end

def over?(board)
  draw?(board) || won?(board)
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  winner(board) == "X" || winner(board) == "O" ? true : nil
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|id| board[id] == "X"}
      return "X"
    elsif combo.all? {|id| board[id] == "O"}
      return "O"
    end
  end
  return nil
end
