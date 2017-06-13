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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (0..8).include?(index) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space != " "
      count += 1
    end
  end
  count
end

def current_player(board)
  count = turn_count(board)
  count % 2 == 0 ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player(board)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  res = false
  WIN_COMBINATIONS.each do |combination|
    win_comb_1 = combination[0]
    win_comb_2 = combination[1]
    win_comb_3 = combination[2]

    pos_1 = board[win_comb_1]
    pos_2 = board[win_comb_2]
    pos_3 = board[win_comb_3]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return combination
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return combination
    end
  end
  res
end

def full?(board)
  full = false
  board.each do |val|
    if val != " "
      full = true
    else
      full = false
      break
    end
  end
  full
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  comb = won?(board)
  if comb != false
    return board[comb[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
