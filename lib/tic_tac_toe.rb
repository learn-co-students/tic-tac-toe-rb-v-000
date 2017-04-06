# Define your WIN_COMBINATIONS constant
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

#display board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input to index
def input_to_index(user_input)
  user_input.to_i - 1
end

#move
def move(board, index, current_player)
  board[index] = current_player
end

#position taken
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#valid move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#turn
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

#turn counter
def turn_count(board)
  num_turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      num_turns += 1
    end
  end
  return num_turns
end

#current player
def current_player(board)
  return turn_count(board) % 2 == 0 ? "X" : "O"
end

#won?
def won?(board)
  if !board.include?("X") && !board.include?("O")
    return false
  elsif
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  else
    return false
  end
end

#full
def full?(board)
  if !board.include?(" ")
    return true
  else
    return false
  end
end

#draw
def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
end

#over
def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end
end

#winner
def winner(board)
  winning_combo = won?(board)
  if winning_combo
    board[winning_combo.first]
  end
end

#play
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winning_player = winner(board)
    puts "Congratulations #{winning_player}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
