

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS= [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #1st col
  [1,4,7], #2nd col
  [2,5,8], #3rd col
  [0,4,8], #left diagonals
  [2,4,6], #right diagonals
]
#
# # Define display_board that accepts a board and prints
# # out the current state.
def display_board(board)
  puts  " #{board[0]} | #{board[1]} | #{board[2]} "
  puts  "-----------"
  puts  " #{board[3]} | #{board[4]} | #{board[5]} "
  puts  "-----------"
  puts  " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(user_input)
  user_input = user_input.to_i
  user_input = user_input - 1
end
def move(board, index, value)
 board[index] = value
 #need to add a default third argument?
end
def position_taken?(board,index)
  if board[index] == "O"
    return true
  elsif board[index] == "X"
    return true
  else board[index] == " " || "" || nil
    return false
  end
end
def valid_move?(board,index)
  if index.between?(0,8) && position_taken?(board,index) == false
    return true
  else
    return false
  end
end
def turn(board)
  #needs to count occupied positions
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  # #if index is vaild or true
    if  valid_move?(board,index)
      move(board,index,current_player(board))
      display_board(board)
    else
      return turn(board)
    end
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space != " "
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else turn_count(board).odd?
    return "O"
  end
end

def won?(board)
      WIN_COMBINATIONS.detect do |combination|
        board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && position_taken?(board,combination[0])
        #this iterates over WIN_COMBINATIONS comparing the 2nd level array postitions of [0,1,2] to see if they all have x's or o's (this returns an array not true or false?
    end   #end for win combination
  end #end for method

def full?(board)
    # this asks if there are any spaces on the board and returns true if full and false if there are spaces
    board.none? {|space| space == " "}
end

def draw?(board)
      #  returns true if the board has not been won and is full
    if !won?(board) && full?(board)
      return true
      # and false if the board is not won and the board is not full, and false if the board is won.
    else
      return false
    end
end
#
def over?(board)
    #returns true if the board has been won, is a draw, or is full.
    if won?(board) || draw?(board) || full?(board)
      return true
    else
      return false
    end
end

def winner(board)
    #return the token, "X" or "O" that has won the game given a winning board,returns nil when no winner.
    combination = won?(board)
    if combination == nil
      return nil
    else
    return board[combination [0]]
    end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  # # counter = 0
  # loop do
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
        puts "Cats Game!"
    end
  #   # counter += 1
  #     turn(board)
end
