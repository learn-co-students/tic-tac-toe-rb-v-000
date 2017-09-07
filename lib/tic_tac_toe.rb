# test: rspec spec/01_tic_tac_toe_spec.rb
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

def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

def input_to_index(input)
    input.to_i - 1
end

def move(board, index, token)
    board[index] = token
end

def position_taken?(board, index)
    !(board[index] == " " ||  board[index] == "" ||  board[index] == nil)
end

def valid_move?(board, index)
    index.between?(0, 8) && !(position_taken?(board, index))
end

def turn(board)
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    token = current_player(board)
    if valid_move?(board, index)
        move(board, index, token)
        display_board(board)
    else
        turn(board)
    end
end

def turn_count(board)
    counter = 0
    board.each do |position|
        if position == "X" || position == "O"
            counter += 1
        end
    end
    return counter
end

def current_player(board)
    (turn_count(board)).even? ? "X" : "O"
end

def won?(board)
    WIN_COMBINATIONS.detect do |combo|
        position_taken?(board, combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
    end
end

def full?(board)
    board.none?{|el| el.nil? || el == " "}
end

def draw?(board)
    !won?(board) && full?(board)
end

def over?(board)
    won?(board) || full?(board) || draw?(board)
end

def winner(board)
    if combo = won?(board)
        return board[combo[0]]
    else
        return nil
    end
end

#test: rspec spec/02_play_spec.rb
def play(board)
    while !over?(board)
        turn(board)
    end
    if winner = winner(board)
        puts "Congratulations #{winner}!"
    elsif draw?(board)
        puts "Cat's Game!"
    end
end
