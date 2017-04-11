
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]


def won?(board)
    WIN_COMBINATIONS.each  do |winner|
        if winner.all? {|index| board[index] == "X"}
            return winner
        elsif winner.all? {|index| board[index] == "O"}
            return winner
        end
    end
    false
end

def full?(board)
    board.all? { |element| element == "X" || element == "O"}
end

def draw?(board)
    (!won?(board) && full?(board))
end

def over?(board)
    won?(board) || draw?(board)
end

def winner(board)
    if won?(board) == false
        return nil
    else
        a_winning_index = won?(board)[0]
        return board[a_winning_index]
    end
end

def turn_count(board)
    count = 0
    board.each do |spot|
        if spot == "X" || spot == "x" || spot == "O" || spot == "o"
            count += 1
        end
    end
    count
end

def current_player(board)
    if turn_count(board).even?
        return "X"
    else
        return "O"
    end
end

def valid_move?(board, index)
    index.between?(0, 8) && position_taken?(board, index) == false
end


def position_taken?(board, index)
    board[index] != nil && board[index] != "" && board[index] != " "
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    input.to_i - 1
end

def move(board_array, board_index, player)
    board_array[board_index] = player
    display_board(board_array)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    puts "invalid input! Try again"
    turn(board)
  end
end

def play(board)
    until over?(board)
        turn(board)
    end
    if won?(board)
        puts "Congratulations #{winner(board)}!"
    else
        puts "Cats Game!"
    end
end