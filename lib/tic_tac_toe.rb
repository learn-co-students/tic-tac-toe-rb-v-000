require "pry"

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

def input_to_index(input)
    input = input.to_i - 1
end

def move(board, index, player)
    board[index] = player
end

def position_taken?(board, index)
    board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
    !position_taken?(board, index) && index.between?(0,8)
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

def turn_count(board)
    turns = 0
    board.each do | input |
      if input == "X" || input == "O"
        turns += 1
      end
    end
    return turns
end

def current_player(board)
    if turn_count(board) % 2 == 0
      return "X"
    else
      return "O"
    end
end

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
      board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
    end
end

def full?(board)
    board.all? do |space|
    space == "X" || space == "O"
    end
end

def draw?(board)
    !won?(board) && full?(board)
end

def over?(board)
    won?(board) || draw?(board)
end

def winner(board)
    if win_combination = won?(board)
      board[win_combination[0]]
    else
      return nil
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
