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

def move(board, index, token)
    board[index] = token
end

def position_taken?(board, index)
    board[index] && !board[index].strip.empty?
end

def valid_move?(board, index)
    return !position_taken?(board, index) && index >= 0 && index <= 8
end

def turn_count(board)
    return board.count{|x| x=="X" || x == "O"}
end

def current_player(board)
    if turn_count(board) % 2 == 0
        return "X"
    end
    return "O"
end

def turn(board)
    display_board(board)
    puts "Please enter a spot 1-9."
    token = current_player(board)
    user_input = gets.strip
    index = input_to_index(user_input)
    
    if valid_move?(board, index)
        move(board, index, token)
    else
        "Sorry, that was an invalid move!"
        turn(board)
    end
end

def won?(board)
    WIN_COMBINATIONS.each do |combo|
        if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" || 
        board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
            return combo
        end
    end
    false
end

def full?(board)
    return board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
    return full?(board) && !won?(board)
end

def over?(board)
    return !!won?(board) || draw?(board)
end

def winner(board)
    if !won?(board)
        return nil
    end
    return board[won?(board)[0]]
end

def play(board)
    while !over?(board) do 
        turn(board)
    end
    if winner(board)
        display_board(board)
        puts "Congratulations " + winner(board) + "!"
    else
        puts "Cat's Game!"
    end
end