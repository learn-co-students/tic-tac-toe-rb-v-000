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
  elsif draw?(board)
    puts "Cats Game!"
  end

end

def turn(board)

  turn_count(board) == 0 ? player_token = "X" : player_token = current_player(board)

  puts "Player #{player_token}, it is your turn."
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else
    puts "That's not a valid move, let's try that again!"
    turn(board)
  end
end

def turn_count(board)
   board.count{|occupied| occupied != " "}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    wins_x = []
    wins_o = []
    combo.each do |check|
      if board[check]== "X"
        wins_x << check
        if wins_x.count == 3
          return wins_x
        end
      elsif board[check] == "O"
        wins_o << check
        if wins_o.count == 3
          return wins_o
        end
      end
    end
  end
  return false
end

def full?(board)
   !board.any?{|i| i == " "} #Any free space?
end

def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
   draw?(board) || won?(board)
end

def winner(board)
  current_player(board) == "O" ? "X" : "O" #You can only win on your turn.
end
