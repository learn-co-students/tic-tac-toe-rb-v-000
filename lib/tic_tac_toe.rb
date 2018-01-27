# Helper methods

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def display_board(board)

   puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
   puts "-----------"
   puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
   puts "-----------"
   puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "

end

def input_to_index(value)

    value.to_i - 1
    #position = value.to_i
    #position - 1

end

def move(board, index, character)

    board[index] = character

end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)

  if  index > 8 || position_taken?(board, index) || index < 0
    false
  else
    true
  end
end

def turn(board)

  puts "Please enter 1-9:"
  number = gets.strip
  index = input_to_index(number)



  if valid_move?(board, index)
    character = current_player(board)
    move(board, index, character)
  else
    turn(board)
  end
end

def turn_count(board)

  turn = 0
  board.each do |character|
    if turn < board.length && (character == "X" || character == "O")
      turn += 1
    end
  end
  return turn
end

def current_player(board)

    turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find do |win_array|
    board[win_array[0]] == board[win_array[1]] && board[win_array[1]] == board[win_array[2]] && position_taken?(board, win_array[0])
  end
end

def full?(board)

  board.all? do |character|
    character == "X" || character == "O"
  end
end

def draw?(board)

   !won?(board) && full?(board)

end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)

  if won?(board) && board[won?(board)[0]] == "X"
    return "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    return "O"
  else
    return nil
  end
end

def play(board)

  until over?(board)
    turn(board)
  end

  if won?(board)
        puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
