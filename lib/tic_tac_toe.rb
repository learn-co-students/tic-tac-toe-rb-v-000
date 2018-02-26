# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,4,8],
                    [2,4,6],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8]
                    ]
                    
def won?(board)  
  won = false
  WIN_COMBINATIONS.each do |win_combination|
     position_1 = board[win_combination[0]]
     position_2 = board[win_combination[1]]
     position_3 = board[win_combination[2]]
     if (position_1 == "X" && position_2 == "X"  && position_3 == "X") || (position_1 == "O" && position_2 == "O"  && position_3 == "O")
       return win_combination.to_a
     end
  end
  return false
end

def full?(board)
  board.none? { |element| element ==" " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winner_combination = won?(board)
  if !winner_combination
    return nil
  end
  if board[winner_combination[0]] == "X"
    return "X"
  else
    return "O"
  end
end
def turn_count(board)
  counter = 0
  board.each do |cell|
    if cell == 'X' || cell == 'O'
    counter += 1
    end
  end
  return counter
end

def current_player(board)
  count = turn_count(board)
  if count%2 == 0 
    'X'
  else
    'O'
  end
end
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  converted_input = user_input.to_i - 1
end

def move(board,position, char)
  board[position]=char
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board,index)
    return TRUE
  else
    return FALSE
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
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
 # puts "Game over"
end