
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input) 
  return user_input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [ 
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? { |n| board[n] == "X" }
      return win_combination
    elsif win_combination.all? { |n| board[n] == "O" }
      return win_combination
    end
  end
  
  if board.none? { |n| n == "X" or "O" }
    return false
  end
end


def full?(board)
  
  if  board.all? { |n| n == "X" or n == "O" } 
    return true
  end

end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if draw?(board)
    return true
  end
  
  if won?(board) 
    return true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? { |n| board[n] == "X" }
      return "X"
    elsif win_combination.all? { |n| board[n] == "O" }
      return "O"
    end
    
    if !won?(board)
      return nil
    end
  end
end

def turn_count(board)
  count = 0
  board.each do |n|
    if n == "X" || n == "O"
      count += 1
    end
  end
  count
end


def current_player(board)
  
  if turn_count(board) % 2 == 0 
    return "X"
  else return "O"
  end
end

def valid_move?(board, index)
  if (position_taken?(board, index) == false) && (index.between?(0, 8))
     return true 
  elsif position_taken?(board, index) == true
    return false
  end
end


def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false
  else 
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    character = current_player(board)
    move(board, index, character)
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
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
