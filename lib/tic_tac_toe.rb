WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, player = "X")
  board[location-1] = player
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def valid_move?(board, location)
  location = location.to_i - 1
  location.between?(0, 8) && !position_taken?(board, location)
end

def turn(board)
  prompt = "Where would you like to go? Input 1-9"
  puts prompt
  user_move = gets.strip

  if valid_move?(board, user_move)
    move(board, user_move.to_i, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  board.count{|cell| cell == "X" || cell == "O"}
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|cell| position_taken?(board, cell) && board[cell] == "X"} ||\
      combination.all? {|cell| position_taken?(board, cell) && board[cell] == "O"}
      return combination
    end
  end
  return false
end

def full?(board)
  board.none? {|cell| cell.nil? || cell == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if over?(board) && won?(board)
    combination = won?(board)
    if combination.length > 0
      board[combination[0]]
    end
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end