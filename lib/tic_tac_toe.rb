WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]


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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def current_player(board)
  count = 0
  board.each do |spot|
    if spot != " "
      count += 1
    end
  end

  if count.even?
    "X"
  else
    "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  while ! over?(board)
    turn(board)
  end
  if winner(board) == "X"
      puts "Congratulations X!"
    elsif  winner(board) == "O"
      puts "Congratulations O!"
    elsif draw?(board)
      puts "Cats Game!"
     end

 end


 def full?(board)
   board.all? {|letter| letter == "X" || letter == "O"}
 end

 def draw?(board)
   full?(board) && won?(board) == false
 end

 def over?(board)
    won?(board) || draw?(board)
 end

 def winner(board)
   if won?(board) == false
    nil
   else
     x = won?(board)
     board[x[0]]
   end
 end

 def turn_count(board)
   count = 0
   board.each do |spot|
     if spot != " "
       count += 1
     end
   end
   count
 end

 def won?(board)
   WIN_COMBINATIONS.each do |combo|
     if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
       return combo
     end
   end
   false
 end
