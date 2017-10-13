# Helper Method
# Helper Methods
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

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
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

# Define your play method below
def play(board)
  while !over?(board)
    turn(board)
  end
  if over?(board)
    if winner = winner(board)
      puts "Congratulations #{winner}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
end

def turn_count(board)
  count = 0
  board.each do |b|
    if b != (" " || "")
      count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
    result = ""
    win_result = []
    WIN_COMBINATIONS.each do |win|
      if (board[win[0]] == board[win[1]] &&  board[win[0]] == board[win[2]] && board[win[0]] == "X") ||
         (board[win[0]] == board[win[1]] &&  board[win[0]] == board[win[2]] && board[win[0]] == "O")
        win_result << win[0]
        win_result << win[1]
        win_result << win[2]
      end
      result = win_result
    end
    result == [] ? false : result
end

def full?(board)
  board.none? { |b| b == ( " " || "" ) }
end

def empty?(board)
  board.all? { |b| b == ( " " || "" ) }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if result = won?(board)
    winner = board[result[0]]
  end
  winner
end
