board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle
  [6,7,8], #bottom
  [0,3,6], #left
  [1,4,7], # middle
  [2,5,8], #right
  [0,4,8], #diagonal
  [2,4,6]  #diagonal
]

def display_board(array)
  puts " #{array[0]} | #{array[1]} | #{array[2]} "
  puts "-----------"
  puts " #{array[3]} | #{array[4]} | #{array[5]} "
  puts "-----------"
  puts " #{array[6]} | #{array[7]} | #{array[8]} "
end

def input_to_index(input)
input = input.to_i
input -1
end

def move(board, index, current_player)
board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

  def valid_move?(board, index)
     if index.between?(1,9) && !position_taken?(board, index)
     end
    index.between?(0,8) && !position_taken?(board, index)
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

  def turn_count(board)
  count = 0
  board.each do |spots|
  if spots == "O" ||spots == "X"
    count += 1
  end
  end
  count
  end

  def current_player(board)
    turn_count(board).even? ? "X" : "O"
  end

  def won?(board)
   WIN_COMBINATIONS.detect do |win|
      board[win[0]] == board[win[1]] && board[win[2]] == board[win[0]] && position_taken?(board, win[0])
   end
  end

  def full?(board)
    board.none? { |i|  i == " "}
  end

  def draw?(board)
     full?(board) && !won?(board)
  end

  def over?(board)
    won?(board) || full?(board)
  end

  def winner(board)
    if  win = won?(board)
      board[win.first]
      # binding.pry
    end
  end

def play(board)
  until over?(board) || draw?(board) do
    turn(board)
  end
      if draw?(board)
        puts "Cat's Game!"
      elsif winner(board) == "X"
        puts "Congratulations X!"
      elsif winner(board) == "O"
        puts "Congratulations O!"
    end
end
