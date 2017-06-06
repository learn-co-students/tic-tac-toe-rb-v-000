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
    user_input.to_i - 1
end

def move(board, index, play)
  board[index] = play
end

def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
end

def valid_move? (board, index)
  if index.to_i.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
     turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |array|
    if "#{array}" != " "
    counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    position_taken?(board, win[0])
      if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
        return win
      elsif
       board[win[0]] == "O" && board[win[1]] == "O"  && board[win[2]] == "O"
       return win
      else
        false
      end
    end
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
     true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
 if won?(board)
   board[won?(board)[0]]
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
