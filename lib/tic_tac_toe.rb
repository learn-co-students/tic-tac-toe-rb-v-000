WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
  return index
end

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken? (board, index)
  if board[index] == "X" or board[index] == "O"
    return true
  end
  false
end

def valid_move?(board, index)
  if index < 0 || index > 8
    return false
  elsif position_taken?(board, index) == true
    return false
  end
  true
end

def turn_count(board)
  turns = 0
  board.each do |position|
    if position == "X" || position == "O"
      turns +=1
    end
  end
  return turns
end

def current_player(board)
  turns = turn_count(board)
  if turns == 0 || turns % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input=gets.strip
  index = input_to_index(user_input)
  player_token = current_player(board)
  if valid_move?(board,index) == true
    move(board,index,player_token)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
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

  false
end

def full?(board)
  board.each do |position|
    if position == " "
      return false
    end
  end
  true
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
  false
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    return true
  end
  false
end

def winner(board)
  win_combination = won?(board)
  if over?(board) == true && draw?(board) == false
    win_index = win_combination[0]
    letter = board[win_index]
    return letter
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board) != false
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else draw?(board) == true
    puts "Cat's Game!"
  end
end
