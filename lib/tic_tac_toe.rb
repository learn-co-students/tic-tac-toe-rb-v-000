# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

# Define a method display_board that prints a 3x3 Tic Tac Toe Board
board = ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ",
        "   "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end
# code your input_to_index and move method here!
def input_to_index(input)
    index = input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
    if index < 0 || index > 8
        return false
    elsif position_taken?(board, index)
        return false
    else
        return true
    end

end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  char = current_player(board)
  if valid_move?(board, index)
      move(board, index, char)
      display_board(board)
  else turn(board)
  end
end

def turn_count(board)
    turn = 0
    board.each do | position |
      if position == 'X' || position == 'O'
        turn += 1

      end
    end
    return turn
end

def current_player(board)
    if turn_count(board).even?
        return "X"
    else
        return "O"
    end
end

def won?(board)

    WIN_COMBINATIONS.detect do |win_combo|
        board[win_combo[0]] == board[win_combo[1]] && board[win_combo[2]] == board[win_combo[1]] && position_taken?(board, win_combo[0])
    end
end

def full?(board)
    board.all? do |place|
        place == "X" || place == "O"
    end
end

def draw?(board)
    if full?(board) && !won?(board)
        true
    else won?(board)
        false
    end

end

def over?(board)
    if
        won?(board) || draw?(board) || full?(board)
        true
    else
        false
    end
end
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
