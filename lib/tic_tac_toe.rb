WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row 
[6,7,8], # Bottom row
[0,3,6], # Vertical first row win
[1,4,7], # Vertical second row win
[2,5,8], # Vertical third row win 
[0,4,8], # Diagonal top win
[6,4,2] # Diagonal bottom win
]

def display_board(board) #display_board displays the current state of the board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end

#move determines where a player will move
def move(board, input_to_index(user_input), character = "X")
    board[input_to_index(user_input)] = character
end

#position_taken? will determine if the current position has been taken
def position_taken?(board, input_to_index(user_input))
    !(board[input_to_index(user_input)].nil? || board[input_to_index(user_input)] == " ")
end

#valid_move? will check to see if the current move is valid
def valid_move?(board, location)
    location = location.to_i
    location.between?(1,9) && !position_taken?(board, location - 1) && (board[location - 1].nil? || board[location - 1] == " ")
end

#turn will have the logic for a complete turn
def turn(board)
    puts "Please enter a number between 1 and 9:"
    input = gets.to_i
    if !valid_move?(board, input)
        puts "Please enter a number between 1 and 9:"
        input = gets.to_i
    end
    move(board, input, current_player(board))
    display_board(board)
end

#turn_count will return how many turns have been played
def turn_count(board)
    board.count{|character| character == "X" || character == "O"}
end

#current_player determines which player turn it is
def current_player(board)
    if turn_count(board) % 2 == 0
        return "X"
    else
        return "O"
    end
end

def won?(board)
  WIN_COMBINATIONS.find { |w_c| board[w_c[0]] == board[w_c[1]] && board[w_c[1]] == board[w_c[2]] && board[w_c[0]] != " " }
end

def full?(board)
  board.each do |spaces|
    if spaces != "X" && spaces != "O"
      return false
    else
    true
  end
 end
end

def draw?(board)    
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board) #=> ["X","X","X"]
  winner = won?(board) #=> [6,4,2]
  if winner
    board[winner[0]]
  end
end

#play combines all the logic to play Tic-Tac-Toe
def play(board)
    until over?(board)
        turn(board)
    end

    if over?(board) && won?(board)
        puts "Congratulations #{winner(board)}!"
    else
        puts "Tie Game!"
    end
end  