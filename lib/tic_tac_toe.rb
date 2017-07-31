

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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
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

def turn_count(board)
  counter = 0
    board.each do |board|
      if board == "X" || board == "O"
          counter += 1
      end
    end
    return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
# iterate through each winning combination ands returns false if no win or winning combination if true returns first true element
  WIN_COMBINATIONS.detect do |win_combination|
# iterate through each index in each winning combination. #select returns array of true values from code block
# block checks if each index from win combination is equal to X
    if win_combination.all? {|index| board[index] == "X"}
      return win_combination
    elsif win_combination.all? { |index| board[index] == "O"}
      return win_combination
    else
      false
    end
  end
end



def full?(board)
board.none? { |board| board == "" || board == " " || board == nil }
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !won?(board)
    return false
  else
    won?(board)
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !draw?(board) & won?(board)
    arr = won?(board)
    return board[arr[0]]
  elsif !won?(board)
    return nil
  end
end

def play(board)
  while !over?(board) && !won?(board) do
    turn(board)
    won?(board)
    draw?(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board) 
      puts "Cats Game!"
    end
end
