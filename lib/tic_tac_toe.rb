WIN_COMBINATIONS = [


  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
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
  !(board[location].nil? || board[location] == " ")
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

   def turn(board)
current_player(board)
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
  # board.count{|token| token == "X" || token == "O"}

  turns = 0

  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns

end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    tokens = [board[win_combination[0]],
              board[win_combination[1]],
              board[win_combination[2]]]
    tokens_X = tokens.all?{ |token| token == "X" }
    tokens_O = tokens.all?{ |token| token == "O" }
    return win_combination if tokens_X || tokens_O
  end
  false
end

def full?(board)
  board.none?{|token| token == " " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    board[win_combination[0]]
  end
end

def play(board)
turn(board) until over?(board)
if won?(board)
      puts "Congratulations #{winner(board)}!" 
    elsif draw?(board)     
  puts "Cats Game!" 
  end 
end
