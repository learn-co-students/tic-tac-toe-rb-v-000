# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def display_board (board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  puts (" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts("-----------")
  puts (" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts("-----------")
  puts (" #{board[6]} | #{board[7]} | #{board[8]} ")
end

def input_to_index(input)
  input.to_i - 1
end

def valid_move? (board, index)
  if !position_taken?(board, index) && (index.between?(0,8))
    true

  else
    false
  end
end

def move (board, idx, player)
  board[idx] = player
end




def turn_count(board)
  count = 0
  board.each do |board|
    if ("#{board}" == "X" || "#{board}" == "O")
      count += 1
    end
  end
  count
end


def current_player (board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end


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

def won?(board)
i = 0
  while i < 8
      j = 0
      if (board[WIN_COMBINATIONS[i][j]] == "X" && board[WIN_COMBINATIONS[i][j+1]] == "X" && board[WIN_COMBINATIONS[i][j+2]] == "X")
        return WIN_COMBINATIONS[i], "X"

      elsif (board[WIN_COMBINATIONS[i][j]] == "O" && board[WIN_COMBINATIONS[i][j+1]] == "O" && board[WIN_COMBINATIONS[i][j+2]] == "O")
        return WIN_COMBINATIONS[i], "O"

      end
      i += 1
  end
  false
end

def full?(board)
  board.all? { |position| position != " " && position != nil }
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if draw?(board)
    true

  elsif won?(board)
    true

  end
end


def winner(board)
  if won?(board) != false
    win_combo, winner = won?(board)
      if winner == "X"
        return "X"
      elsif winner == "O"
        return "O"
      end
  end
end

def turn(board)
  puts "Where would you like to go? Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)

    while (valid_move?(board,index) == false)
      puts "Please enter 1-9 again:"
      input = gets.chomp
      index = input_to_index(input)
    end

    if current_player(board) == "X"
      board[index] = "X"
    else
      board[index] = "O"
    end

    display_board (board)
end

def play(board)
  until over?(board) == true
    turn(board)
  end

win_combo, winner = won?(board)

  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"

  elsif draw?(board)
    puts "Cats Game!"
  end
end
