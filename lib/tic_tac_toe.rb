WIN_COMBINATIONS = [
    [0,1,2], #Horizontal/Top row
    [3,4,5], #Horizontal/Middle row 
    [6,7,8], #Horizontal/Bottom row
    [0,3,6], #Vertical/First Row
    [1,4,7], #Vertical/Second Row
    [2,5,8], #Vertical/Third Row
    [0,4,8], #Diagonal/Upper left
    [2,4,6]  #Diagonal/Upper right
    ]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} ","-----------"," #{board[3]} | #{board[4]} | #{board[5]} ","-----------"," #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    "#{input}".to_i - 1
end

def move(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
        false
    elsif board[index] == "X" || board[index] == "O"
        true
    end
end

def valid_move?(board, index)
    if index.between?(0, 8) && !position_taken?(board, index)
        true
    else
        false 
    end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  valid_move = valid_move?(board,index)
  if valid_move
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
    token_counter = 0
    board.each do |token|
        if token == "X" || token == "O"
            token_counter += 1
        end
    end
    return token_counter
end

def current_player(board)
    if turn_count(board) % 2 == 0
        "X"
    else
        "O"
    end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
        if (board[combo[0]]) == "X" && (board[combo[1]]) == "X" && (board[combo[2]]) == "X"
            return combo    
        elsif (board[combo[0]]) == "O" && (board[combo[1]]) == "O" && (board[combo[2]]) == "O"
            return combo
        end
        false
    end
end

def full?(board) 
    board.all? do |token|
        token == "X" || token == "O"
    end
end  

def draw?(board)
    if !won?(board) && full?(board)
        true
    end
end

def over?(board)
    if won?(board) || draw?(board) || full?(board)
    true
    end  
end

def winner(board)
     WIN_COMBINATIONS.detect do |combo|
        if (board[combo[0]]) == "X" && (board[combo[1]]) == "X" && (board[combo[2]]) == "X"
            return "X"    
        elsif (board[combo[0]]) == "O" && (board[combo[1]]) == "O" && (board[combo[2]]) == "O"
            return "O"
        end
        nil
    end
end

def play(board)
    until over?(board)
     turn(board)
    end
    if draw?(board)
      puts "Cats Game!"
    else
      puts "Congratulations #{winner(board)}!"
    end
end
    