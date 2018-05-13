# Define your WIN_COMBINATIONS constant
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

# Define display_board that accepts a board and prints
# out the current state.
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your #valid_move? method here
def valid_move?(board, index)
  if index < 0 || index > 8
    return FALSE
  elsif position_taken?(board, index)
    return FALSE
  else
    return TRUE
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  user_move = input_to_index(user_input)
   if valid_move?(board, user_move)
     move(board, user_move, current_player(board))
     display_board(board)
   else
     turn(board)
   end
end

def move(board, index, user)
  return board[index] = user
end

def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      return FALSE
    else
      return TRUE
    end
  end

def input_to_index(user_input)
  return user_input.to_i - 1
end

def won?(board)
    WIN_COMBINATIONS.each do |combination|
      win = []
      combination.each do |index|
        win.push(board[index])
      end
      if win.all?{|e| e == "X"} || win.all?{|e| e == "O"}
        return combination
      end
    end
    return FALSE  
  end
  
def full?(board)
  if board.any?{|e| e == " "}
    return FALSE
  else
    return TRUE
  end
end
  
def draw?(board)
  if won?(board) != FALSE
    return FALSE
  elsif full?(board) == TRUE
    return TRUE
  else
    return FALSE
  end
end
  
def over?(board)
    if won?(board) != FALSE || draw?(board) == TRUE || full?(board) == TRUE
      return TRUE
    else 
      return FALSE
    end
end
  
def winner(board)
    if won?(board) != FALSE
      win_combo = won?(board)
      return board[win_combo[0]]
    else
      return nil 
    end
end
  
def turn_count(board)
  counter = 0 
  board.each do |move|
    if move == "X" || move == "O"
      counter += 1 
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board).even? 
    return "X"
  else
    return "O"
  end
end

def play(board)
  while over?(board) == FALSE
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif 
    draw?(board)
    puts "Cat's Game!"
  else
    #do nothing
  end
end