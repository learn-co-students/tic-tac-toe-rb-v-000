require 'pry'

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
]

def play(board)
    until over?(board)
        display_board(board)
        turn(board)
    end

    if won?(board)
        puts "Congratulations #{winner(board)}!"
    end

    if draw?(board)
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

def input_to_index(input)
    input = input.to_i
    if input == 0
        -1
    else
        input - 1
    end
end

def move(board, position, player)
    board[position] = player
end

def position_taken?(board, position)
    board[position] != " " ? true : false
end

def valid_move?(board, position)
    if position == -1
        return false
    end

    if board[position] == " "
        return true
    else
        return false
    end
end

def turn(board)
    puts "Make your move."
    input = gets.strip
    position = input_to_index(input)
    if position && valid_move?(board, position) && !position_taken?(board, position)
        player = current_player(board)
        move(board, position, player)
    else
        turn(board)
    end
end

def turn_count(board)
    i = 0
    turns = 0
    while i < board.length
        if board[i] != " "
            turns += 1
        end
        i += 1
    end
    turns
end

def current_player(board)
    turn_count(board).even? ? 'X' : 'O'
end

def won?(board)
    WIN_COMBINATIONS.detect do |combo|
        board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(board, combo[0])
    end
end

def full?(board)
    if turn_count(board) == 9 && !won?(board)
        true
    else
        false
    end
end

def draw?(board)
    full?(board)
end

def over?(board)
    if draw?(board) || won?(board)
        true
    end
end

def winner(board)
    if winning_combo = won?(board)
        board[winning_combo.first]
    end
end
