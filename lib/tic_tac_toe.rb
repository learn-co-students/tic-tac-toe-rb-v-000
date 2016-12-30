WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  input = user_input.to_i
  input -= 1
  return input
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def valid_move?(board, location)
  if ((position_taken?(board, location)) || !(location.between?(0,8)))
    false
  else
    true
  end
end

def turn(board)
  display_board(board)
  player = current_player(board)
  puts "Player #{player}, please enter your move:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index) then
    move(board, index, player)
  else
    puts "Invalid move."
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |contents|
    if contents != ' '
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  player = turn_count(board).even? ? 'X' : 'O'
  return player
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    # puts "win_combination is #{win_combination}"
    win_check = [board[win_combination[0]], board[win_combination[1]], board[win_combination[2]]]
    # puts "win_check is #{win_check}"
    if win_check.all? {|player| player == 'O'} then
        # puts "evaluated true; winner O"
        win_player = "O"
        return win_combination
    elsif win_check.all? {|player| player == 'X'} then
        # puts "evaluated true; winner X"
        win_player = "X"
        return win_combination
    else
        # puts "evaluated false"
    end
  end
  return false
end

def draw?(board)
  if ((!won?(board)) && (full?(board))) then
    return true
  else
    return false
  end
end

def over?(board)
  if ((full?(board) != false) || (won?(board)) || (draw?(board))) then
    return true
  else
    return false
  end
end

def winner(board)
  win_combination = won?(board)
  if won?(board) then
    return board[win_combination[0]]
  else
    return nil
  end
end

def full?(board)
  if board.include?(" ") then
    return false
  else
    return true
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board) then
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end
