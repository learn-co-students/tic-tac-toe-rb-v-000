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
  puts " #{board[0]} | #{board[1]} | #{board[2]} \n"
  puts "-----------\n"
  puts " #{board[3]} | #{board[4]} | #{board[5]} \n"
  puts "-----------\n"
  puts " #{board[6]} | #{board[7]} | #{board[8]} \n"
end

def input_to_index(input)
  index = "#{input}".to_i - 1
  return index
end

def move(board, index, character)
  puts board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else board[index] == "X" || board[index] == "O"
      return true
  end
end

def valid_move?(board, index)
    if index.between?(0, 8) && !position_taken?(board, index)
      return true
    else false
    end
  end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  while !valid_move?(board, index)
    puts "invalid"
    input = gets.strip
    index = input_to_index(input)
  end
  puts move(board, index, current_player(board))
  puts display_board(board)
end

def turn_count(board)
 counter = 0
 board.each do |position|
 if position == "X" || position == "O"
 counter += 1
 end
end
counter
end

def current_player(board)
 if turn_count(board).even?
   return "X"
 elsif turn_count(board).odd?
   return "O"
 else puts "Thank you for playing."
 end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if ((board[win_combination[0]] == "X" || board[win_combination[0]] == "O") &&
        (board[win_combination[0]] == board[win_combination[1]]) &&
        (board[win_combination[1]] == board[win_combination[2]]) &&
        (board[win_combination[2]] == board[win_combination[0]]))
        return win_combination
        return true
    end
  end
  return false
end

def full?(board)
  if board.include?(" ") || board.include?("")
  return false
  else true
  end
end

def draw?(board)
  puts "Cat's Game!"
  return full?(board) && !won?(board)
end

def over?(board)
  return draw?(board) || won?(board) || full?(board)
end

def winner(board)
  if !won?(board) || !over?(board)
    return nil
  else won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  while !over?(board)
  puts turn(board)
  puts won?(board)
  puts draw?(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
  end
end
