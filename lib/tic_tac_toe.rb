def turn_count(board)
  turn_count = 0 
  board.each do |user|
    if (user == "X" || user == "O")
      turn_count += 1
    end
  end
    return turn_count
end

def current_player(board)
  i = turn_count(board)
  if i == 0 
    return  "X"
  elsif i % 2 == 0
    return "X"
  else i % 2 == 1
     return "O"
  end 
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  adjusted_input = user_input.to_i - 1
  return adjusted_input
end

def update_array_at_with(board, adjusted_input, current_player)
  board[adjusted_input] = current_player
  return board
end

def move(board, adjusted_input, current_player)
  board = update_array_at_with(board, adjusted_input, current_player)
  display_board(board)
end

def valid_move?(board, index)
    if (index > 8 || index < 0 || index % 1 != 0 || position_taken?(board, index) == true)
      false
    else true
  end
end

def position_taken?(board, index)
    if (board[index] == "" || board[index] == " " || board[index] == nil)
      false
    else true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    current_player = current_player(board) 
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  # for each win_combination in WIN_COMBINATIONS
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

  if board[win_combination[0]]==board[win_combination[1]]&&board[win_combination[0]]==board[win_combination[2]]&&board[win_combination[0]]!=" "
        return win_combination
      end
    end
  false
end

def full?(board)
  if board.any? { |i| i == " " }
    return false
  end
  true
end

def draw?(board)
  if (won?(board) == false && full?(board) == true)
    return true
  end
  false
end

def over?(board)
  if (won?(board) != false && full?(board) == true)
    return true
  elsif (won?(board) != false && full?(board) == false)
    return true
  elsif draw?(board) == true
    return true
  else (won?(board) == false && full?(board) == false)
    return false
  end
end

def winner(board) 
  if won?(board) == false
    return nil
  else 
    win_combination = won?(board)
      winner = board[win_combination[0]]
      return winner
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) != false
    winner = winner(board)
    puts "Congratulations #{winner}!"
  end
  if draw?(board) == true
    puts "Cat's Game!"
  end
end