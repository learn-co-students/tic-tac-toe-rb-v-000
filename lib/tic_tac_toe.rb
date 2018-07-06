

# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, index, player)
  player = current_player(board)
  board[index] = player
end

#game_status
def position_taken?(board,index)
  if board[index] == " " || board[index] == ""
    false
  else
    true
  end
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  board.count{|item| item == "X" || item == "O"}
end

def current_player(board)
 turn_count(board) % 2 == 0 ? "X" : "O"
end



WIN_COMBINATIONS = [
  [0,1,2], [3,4,5],[6,7,8],[0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]
]

def won?(board)
  combo = []
  board.all? { |e| e == " " || e == ""}

  if board[0] == board[1] && board[0] === board[2] && (board[0] == "X" || board[0] == "O")
    true
    combo = WIN_COMBINATIONS[0]
  elsif  board[3] == board[4] && board[3] === board[5] && (board[5] == "X" || board[5] == "O")
    true
    combo = WIN_COMBINATIONS[1]
  elsif board[6] == board[7] && board[6] === board[8] && (board[8] == "X" || board[8] == "O")
    true
    combo = WIN_COMBINATIONS[2]
  elsif board[0] == board[4] && board[0] === board[8] && (board[8] == "X" || board[8] == "O")
    true
    combo = WIN_COMBINATIONS[3]
  elsif board[2] == board[4] && board[2] === board[6] && (board[6] == "X" || board[6] == "O")
    true
    combo = WIN_COMBINATIONS[4]
  elsif  board[0] == board[3] && board[0] === board[6] && (board[6] == "X" || board[6] == "O")
    true
    combo =WIN_COMBINATIONS[5]
  elsif  board[1] == board[4] && board[1] === board[7] && (board[7] == "X" || board[7] == "O")
    true
    combo = WIN_COMBINATIONS[6]
  elsif  board[2] == board[5] && board[2] === board[8] && (board[8] == "X" || board[8] == "O")
    true
    combo = WIN_COMBINATIONS[7]
  else
    false
  end

end

def full?(board)
  check = board.any? { |item| item == "" || item == " "  }
  if check == true
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  end
end

def over?(board)
  if draw?(board) == true && won?(board) == false
    true
  elsif full?(board) == false && won?(board) == false
    false
  else
    true
  end
end

# Define your play method below
def play(board)
  until over?(board) == true
    input = turn(board)
  end

  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end

def winner(board)
  if won?(board) != false
    combo = 100
    combo = won?(board)
    position = Integer(combo[0])
    winna = String(board[position])

    if winna == "X"
      "X"
    elsif winna == "O"
      "O"
    end
  else
    nil
  end

end
