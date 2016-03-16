WIN_COMBINATIONS = [
    # top row win
    [0, 1, 2],
    # middle row win
    [3, 4, 5],
    # bottom row win
    [6, 7, 8],
    # left col win
    [0, 3, 6],
    # middle col win
    [1, 4, 7],
    # right col win
    [2, 5, 8],
    # left diag win
    [0, 4, 8],
    # right diag win
    [6, 4, 2]
]

#display_board displays the current state of the board
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#move determines where a player will move
def move(board, location, player = "X")
    board[location - 1] = player
end

#position_taken? will determine if the current position has been taken
def position_taken?(board, location)
    !(board[location].nil? || board[location] == " ")
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
    if valid_move?(board, input)
        move(board, input)
    else
        puts "Please enter a number between 1 and 9:"
        input = gets.to_i
    end
    display_board(board)
end

#turn_count will return how many turns have been played
def turn_count(board)
    counter = 0
    board.each do |current_player|
        if !(current_player.nil? || current_player == " ")
            counter += 1
        end
    end
    return counter
end

#current_player determines which player turn it is
def current_player(board)
    if turn_count(board) % 2 == 0
        return "X"
    else
        return "O"
    end
end

#won? will determine if the game has been won, or is a draw
def won?(board)
    WIN_COMBINATIONS.detect do |win_combo|
        position_taken?(board, win_combo[0]) && (board[win_combo[0]] == board[win_combo[1]]) && (board[win_combo[1]] == board[win_combo[2]])
    end
end

#full? will determine if the board is full
def full?(board)
    WIN_COMBINATIONS.all? do |tokens|
        position_taken?(board, tokens[0])
    end
end

#draw? determines if the game is a draw
def draw?(board)
    full?(board) && !won?(board)
end

#over? determines if the game is over
def over?(board)
    won?(board) || full?(board) || draw?(board)
end

#winner determines which player won the game
def winner(board)
    WIN_COMBINATIONS.detect do |winner|
        if position_taken?(board, winner[0]) && board[winner[0]] == "X" && board[winner[1]] == "X" && board[winner[2]] == "X"
            return "X"
        elsif position_taken?(board, winner[0]) && board[winner[0]] == "O" && board[winner[1]] == "O" && board[winner[2]] == "O"
            return "O"
        end
    end
end

#play combines all the logic to play Tic-Tac-Toe
def play(board)
    until over?(board)
        turn(board)
    end
    turn(board)
end






