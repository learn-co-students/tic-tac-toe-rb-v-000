WIN_COMBINATIONS = [
    [0,1,2], #top row win
    [3,4,5], #middle row win
    [6,7,8], #bottom row win 
    [0,3,6], #column 1 win
    [1,4,7], #middle column win
    [2,5,8], #column 3 win
    [0,4,8], #diagonal win 
    [2,4,6] #diagonal win
  ]

def play(board)
    while !over?(board)
        turn(board)   
    end

    if won?(board)
        puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
        puts "Cat's Game!"
    end
end 

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

def move(board, index, character)
    board[index] = character
end

def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
    count = 0 
    board.map do |occupied|
        if occupied == "X" || occupied == "O" 
            count +=1
        end
    end
    count
end

def current_player(board) 
    turn_count(board) % 2 == 0 ? "X" : "O"
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

def won?(board)
    WIN_COMBINATIONS.detect do |array|
       board[array[0]] == board[array[1]] && 
       board[array[1]] == board[array[2]] &&
       position_taken?(board, array[0])
    end
end 
   
def full?(board)
     board.all? do |answer|
       answer != " " ? true : false
     end
end
   
def draw?(board)
     !won?(board) && full?(board) ? true : false
end
   
def over?(board)
     won?(board) || draw?(board) ? true : false
end
   
def winner(board) 
    if a = won?(board) 
       board[a.first]
    end
end