WIN_COMBINATIONS = [
    [0, 1 ,2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
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

def move(board, index, player_token)
    board[index] = player_token
end

def position_taken?(board, position)
    if board[position] == "" || board[position] == " " || board[position] == nil
        return false
    else
        return true
    end
end

def valid_move?(board, position)
    if position.between?(0, 8) && !position_taken?(board, position)
        return true
    else
        return false
    end
end

def turn(board)
    puts "Please choose position from 1-9: "
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
        player_token = current_player(board)
        move(board, index, player_token)
        display_board(board)
    else
        turn(board)
    end
end

def turn_count(board)
    count = 0
    board.each do |position|
        if position == "X" || position == "O"
            count += 1
        end
    end
    return count
end

def current_player(board)
    count = turn_count(board)
    if count % 2 == 0
        return "X"
    else
        return "O"
    end
end

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
end

def full?(board)
    board.all? { |element| element == "X" || element == "O" }
end

def draw?(board)
    if won?(board) != nil || !full?(board)
        return false
    else
        return true
    end
end

def over?(board)
    if draw?(board) || won?(board)
        return true
    else
        return false
    end
end

def winner(board)
    if won?(board) != nil
        winner_index = won?(board)
        return board[winner_index[0]]
    end
end

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
