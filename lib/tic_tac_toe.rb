def play(board)
  until over?(board)
  turn(board)
  end
    if won? (board)
      winner(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cats Game!"
  end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
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
  turns = 0
    board.each do |board|
      if board == "X" || board == "O"
        turns += 1
      end
    end
    return turns
end

def current_player(board)
  if turn_count(board) % 2 > 0
    return "O"
  else turn_count(board) % 2 == 0
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo| board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  if board.all? {|i| i == "X" || i == "O"}
    return true
  else
    false
  end
end

def draw?(board)
  WIN_COMBINATIONS.detect do |combo|
  if won?(board)
    return false
  elsif board.detect{|b| b == " "}
    return false
  elsif full?(board)
    return true
  else
    true
  end
end
end

def over?(board)
  if draw?(board)
    return true
  elsif full?(board)
    return true
  elsif won?(board)
    return true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.detect do |combo|
    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]

    index = board[position_1]
    index_2 = board[position_2]
    index_3 = board[position_3]
    if index == "X" && index == index_2 && index_2 == index_3
      return "X"
    elsif index == "O" && index == index_2 && index_2 == index_3
      return "O"
    else
      nil
    end
  end
end
