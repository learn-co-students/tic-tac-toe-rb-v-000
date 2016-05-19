WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], #right column
  [0,4,8], # diag_1
  [2,4,6]  # diag_2
]
#-----------

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
#---------

def move(board, location, current_player)
  location = location.to_i - 1
  board[location] = current_player
end
#---------

def position_taken?(board, location)
  #location = location.to_i - 1
  board[location] != " " && board[location] != ""
end
#---------

def valid_move?(board, location)
  location = location.to_i - 1
  
  location.between?(0,8) && !position_taken?(board, location)
end
#---------

def current_player (board)#, player_turn ="X")

  if turn_count(board) % 2 == 0
    player_turn = "X"
  else
    player_turn = "O"
  end
player_turn
end
#---------

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  location = input#.to_i # -1
  
  

  if valid_move?(board, location)
    player_token = current_player(board)
    move(board, location, player_token)# player_token)
    
    display_board(board)
  else
    turn(board)
  end
end
#---------

def turn_count(board)#counter)
  counter = 0
    board.each do |play| 
      if play == "X" || play == "O"
       counter += 1
      end   
    end
    counter
end
#---------


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
      
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that 'X' won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the win_combination indexes that 'O' won.
      else 
        return_value = false
    end #if
   
  end #1st do
   if return_value = false
    return_value
  end
end # of won?
#------------------------------------------------------------


def full?(board)
board.all? {|i| i == "X" || i == "O"}
end # of full?
#------------------------------------------------------------

def draw?(board)
win_state = won?(board)
full_state = full?(board)

if !win_state && full_state # Test for a draw
    draw_state = true
  elsif win_state #= true) # test for a win
      draw_state = false
    elsif !win_state && !full_state # test for incomplete
        draw_state = false
end
draw_state
end # of draw?
#------------------------------------------------------------


def over?(board)
over_state = false

if draw?(board) 
    over_state = true
  elsif won?(board)
    over_state = true
    elsif full?(board)
      over_state = true
end
over_state
end #of over?
#------------------------------------------------------------


def winner(board)

if won?(board)
  win_array = won?(board)
  token = board[win_array[0]]
end

token
end # of winner?
#------------------------------------------------------------


# Define your play method below
def play(board)

until over?(board) do
  turn(board)
end # do

if won?(board)
    winner_token = winner(board)
    puts "Congratulations #{winner_token}!"
  elsif draw?(board)
      puts  "Cats Game!"
end #if
end # play
#---------