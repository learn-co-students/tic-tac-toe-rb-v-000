require 'pry'

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    input.to_i-1
end

def move(board, position, player)
    board[position] = player
end

def position_taken?(board, position)
    board[position] != " "
    # 
end

def valid_move?(board, position)
    !position_taken?(board, position) && position.between?(0,8)
end

def turn(board)
    puts "Please select a position "
    input = gets.strip
    new_input = input_to_index(input)
    if valid_move?(board, new_input)
        move(board, new_input, current_player((board)))
        display_board(board)
    else
        puts "invalid"
        turn(board)
    end
    display_board(board)
end

def current_player(board)
    turn_count(board) % 2 == 0 ? 'X' : 'O'
end

def turn_count(board)
    counter = 0
    board.each do |count|
        if count == 'X' || count == 'O'
            counter +=1
        end
    end
    counter
end

def won?(board)
    WIN_COMBINATIONS.detect do |combo| 
        board[combo[0]] == board[combo[1]] && 
        board[combo[1]] == board[combo[2]] &&
        position_taken?(board, combo[0])
    end
end

def full?(board)
    board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
    !won?(board) && full?(board)
end

def over?(board)
    draw?(board) || won?(board)
end

def winner(board)
    combo = won?(board)
    if combo
        board[combo[0]]
    end
end

def play(board)
    while !over?(board)
        turn(board)
    end
    
    if won?(board)
        puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
        puts "Cats Game!"
    end
end