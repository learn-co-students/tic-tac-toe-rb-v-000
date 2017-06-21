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
<<<<<<< HEAD
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
=======
      if won?(board)
        return "#{winner?(board)} wins!"
      elsif full?(board) || draw?(board)
        return "It's a draw!"
      end
>>>>>>> 1341cf6b3b2af62679f64e417548ae29acd4f0d3
  end
end

def turn(board)
<<<<<<< HEAD
  turn_count(board) == 0 ? player_token = "X" : player_token = current_player(board)
  puts "Player #{player_token}, it is your turn."
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
=======
  if turn_count(board) == 0
    puts "Player 1, please select X or O"
    player_token = gets.strip.upcase
  else
    player_token = current_player(board)
    puts "we are selecting the player token #{player_token}"
  end
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
>>>>>>> 1341cf6b3b2af62679f64e417548ae29acd4f0d3
  end
end

def turn_count(board)
<<<<<<< HEAD
   board.count{|occupied| occupied != " "}
=======
  puts "looking at board count is #{board.count{|occupied| occupied != " "}}"
  return board.count{|occupied| occupied != " "}
end

def current_player(board)
  if turn_count(board) == 1 #Capture the first move value
    index = 0
    until board[index] !=" " #Scan for first occupied space
        index += 1
    end
    first_move = board[index]
  end
  if first_move == "X"
    return "O"
  end
  return "X"
>>>>>>> 1341cf6b3b2af62679f64e417548ae29acd4f0d3
end

def input_to_index(user_input)
  user_input.to_i - 1
end

<<<<<<< HEAD
=======
def move(board, index, current_player)
  board[index] = current_player
end

>>>>>>> 1341cf6b3b2af62679f64e417548ae29acd4f0d3
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

<<<<<<< HEAD
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
=======
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
  return board.all?{ |i| i.is_a?(String) && i != " "}
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  if board.count{|x| x == "X"} > board.count{|o| o == "O"}
    return "X"
  elsif board.count{|x| x == "X"} < board.count{|o| o == "O"}
    return "O"
>>>>>>> 1341cf6b3b2af62679f64e417548ae29acd4f0d3
  end
  return nil
end
