def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index.to_i - 1
end

def move(array, index, value)
  array[index] = value
end

def valid_move?(board,index)
  if index > (board.length - 1) || index < 0
    return false
  elsif board[index] == " " || board[index] == "" || board[index] == nil
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
      move(board, index, current_player(board))
      display_board(board)
  else
    turn(board)
  end

end

def turn_count(board)
  turns = 0
  board.each do |turn|
      if turn == "X" || turn == "O"
        turns += 1
      end
    end
    turns
end

def current_player(board)
  turns = turn_count(board)
  if turns == 0 || turns % 2 == 0
    return "X"
  else
    return "O"
  end

end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def play(board)
  counter = 0
  display_board(board)
  while counter < 9
    if over?(board)
      if draw?(board)
        puts "Cat's Game!"
        counter = 10
      else won?(board) != false
        puts "Congratulations #{winner(board)}!"
        counter = 10
      end
    else
      turn(board)
      counter += 1
    end
  end
end

# Define your WIN_COMBINATIONS const
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

def won?(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  if(!board.include?("O") && !board.include?("X"))
    return false
  else
    WIN_COMBINATIONS.each do |win_combo|
      if (board[win_combo[0]] == "X") && (board[win_combo[1]] == "X") && (board[win_combo[2]] == "X")
        return win_combo
      elsif ((board[win_combo[0]] == "O") && (board[win_combo[1]] == "O") && (board[win_combo[2]] == "O"))
        return win_combo
      end
    end
  end
  return false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if full?(board) && (won?(board) == false)
    true
  else
    false
  end
end

def over?(board)
  if (won?(board) != false || draw?(board))
    true
  else
    false
  end
end

def winner(board)
  win_combo = won?(board)
  if win_combo == false
    return nil
  elsif board[win_combo[0]] == "X"
    "X"
  elsif board[win_combo[0]] == "O"
    "O"
  end
end
