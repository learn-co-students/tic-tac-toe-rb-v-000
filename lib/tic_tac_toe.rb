# print the current state of the board
def display_board(board)
  puts " #{board[0]} " + '|' + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + '|' + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + '|' + " #{board[7]} " + "|" + " #{board[8]} "
end

#check if the position is taken
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#check if the move is valid
def valid_move? (board, index)
  if position_taken?(board,index) != false || !(index.between?(0,8))
    return false
  elsif position_taken?(board,index) == false && index.between?(0,8)
    return true
  end
end

#convert user input into index
def input_to_index(num)
  num = num.to_i
  return num - 1
end

#do the move
def move(board, index, symbol)
  board[index] = symbol
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    symbol = current_player(board)
    move(board, index, symbol)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  spaces = 0
  board.each do |space|
    if space == "X" || space == "O"
      spaces += 1
    end
  end
  return spaces
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end


# Define your WIN_COMBINATIONS constant
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

#determine if there's a winner
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    end
  end
  return false
end

#determine if the board is full
def full?(board)
  board.all? {|element| element == "X" || element == "O"}
end

#determine if there's a draw
def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  end
end

#determine if the game is over
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

#determines who won the game if there's a winner
def winner(board)
  if !(won?(board))
    return nil
  elsif won?(board).all?{|element| board[element] == "X"}
      return "X"
  elsif won?(board).all?{|element| board[element] == "O"}
      return "O"
  end
end

#play the game
def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
