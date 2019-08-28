WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
    puts " #{board[0]}" + " | " + "#{board[1]}" + " | " + "#{board[2]} "
    puts "-----------"
    puts " #{board[3]}" + " | " + "#{board[4]}" + " | " + "#{board[5]} "
    puts "-----------"
    puts " #{board[6]}" + " | " + "#{board[7]}" + " | " + "#{board[8]} "
end

def input_to_index(input)
 input.to_i - 1
end

def move(board, index, players_character)
  board[index] = players_character
end

def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8) == true
    true
  else 
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
  elsif
    input=gets.strip
  end
  display_board (board)
end

def turn_count(board)
  counter = 0
   board.each do |grid|
     if grid == "X" || grid == "O"
       counter += 1
     end
   end
     counter
end

def current_player (board)
  if turn_count(board).even?
    "X"
    else 
    "O"
  end
end

def won?(board)
    #final_combo = nil
    WIN_COMBINATIONS.each do |win_combo|
      #binding.pry
      if board[win_combo[0]] == board[win_combo[1]] &&  board[win_combo[1]] == board[win_combo[2]] &&  position_taken?(board, win_combo[0])
        return win_combo
      end
    end
    false
  end
  
  def full?(board)
    # return true if every element in the board contains either an "X" or an "O"
    board.all? do |index| 
      if index == "X" || index == "O"
      true
      end
    end
  end  
  
  def draw?(board)
    # returns true if the board has not been won but is full, false if the board is not won and the board is not full, and false if the board is won
    if full?(board) && won?(board) == false
      true
    else
      false
    end 
  end
  
def over?(board)
    # returns true if the board has been won, is a draw, or is full.
    if won?(board) || full?(board)
      true
    elsif draw?(board)
      true
    else  
      false
    end  
end 
  
def winner(board)
  
  winning_trombo = won?(board) 
  
  if winning_trombo
    binding.pry
  end
  # if winning_trombo != false && winning_trombo.all? {| i | board[i] == "X"}
  #   "X" 
  # elsif winning_trombo != false && winning_trombo.all? {| i | board[i] == "O"}
  #   "O"
  # else
    # nil
  # end 
end

# def play(board)
#   # input = gets
    
#   while over?(board) == false
#       turn(board)
#     if over?(board) == true && won?(board) 
#       # break
#         # if winner(board) == "X"
#         #   "Congratulations X!"
#         # elsif winner(board) == "O"
#         #   "Congratulations O!"
#         # end
#     elsif draw?(board) == true
#           "Cat's Game!"
#     else
#       turn(board)
#     end
#   end
# end

def play(board)
  # input = gets
  while over?(board) == false
    turn(board)
    if won?(board) || draw?(board) 
      # over?(board) == true
              if winner(board) == "X"
                puts "Congratulations X!"
              elsif winner(board) == "O"
                puts "Congratulations O!"
              else
                puts "Cat's Game"
              end
    # else
    #   turn(board)
    end  
  end
end
