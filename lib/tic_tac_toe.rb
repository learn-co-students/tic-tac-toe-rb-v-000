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

board = [" "," ", " "," "," "," "," "," "," "]


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

  def move(board, user_input, player_char)
  board[user_input] = player_char
end

def position_taken?(board, index)
!(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
if index.between?(0,8) && !position_taken?(board, index)
  true
else position_taken?(board,index) == true || !index.between?(0,8)
  false
end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
 board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
board[combo[0]] == board[combo[1]] &&
board[combo[1]] == board[combo[2]] && position_taken?(board, combo[2])
      end
  end

    def full?(board)
     board.all?{|index| index == "X"|| index == "O"}
      end

  def draw?(board)
    full?(board) && !won?(board)
end

  def over?(board)
    won?(board) || full?(board) || draw?(board)
  end

  def winner(board)
    if win_combo = won?(board)
      board[win_combo.first]
    end
  end

  def play(board)
    
    while !over?(board)
        turn(board)
      end
      if won?(board)
        puts "Congratulations #{winner(board)}!"
      elsif draw?(board)
        puts "Cat's Game!"
      end
    end
