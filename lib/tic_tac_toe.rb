WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #mid row
  [6,7,8], #bot row
  [0,3,6], #left col 
  [1,4,7], #mid col 
  [2,5,8], #right col 
  [0,4,8], #l>r diag 
  [2,4,6]  #r>l diag 
]

def turn_count(board)
  turns = 0 
  board.each { |space| space == "X" || space == "O" ? turns += 1 : nil}
  turns
end


def current_player(board)
  turn_count(board).even? == true ? "X" : "O"
end 


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

# Validation methods: 
# #won?, #full?, #draw?, #over?, #position_taken?, #valid_move?
def won?(board)
  won = false
  WIN_COMBINATIONS.each do |combo|
    if (combo.all?{|i| position_taken?(board, i)}) && (board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]) 
        won = combo
    end
  end
  won
end

def full?(board)
  board.all?{|space| space == "X" || space == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# checks to see who is the winner, returns X, O, or nil 
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end

def move(board, index, current_player)
  board[index] = current_player
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
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
