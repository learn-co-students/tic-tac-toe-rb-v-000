WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #Left diagonal
  [2,4,6]  #Right diagonal
]

board=["   ","   ","   ","  ","  ","   ","   ","   ","   "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
display_board(board)

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

def move(board, index, current_player = 0, "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  play=0
  until play == 9
  turn(board)
  play += 1
end
end

def turn_count(board)
  turns_played = 0
  board.each do |occupied_positions|
    if occupied_positions == "X" || occupied_positions == "O"
    # puts "#{board[occupied_positions]}.to_i"
    turns_played +=1
    # turns +=  occupied_positions <= board.length-1
    # puts "#{turn_count(occupied_positions)}"
  end
end
  return turns_played
end

def current_player(board)
  num_turns = turn_count(board)
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end

def won?(board)
WIN_COMBINATIONS.find do |win_combination| # [0, 1, 2]
  win_index_1 = win_combination[0] # 0
  win_index_2 = win_combination[1] # 1
  win_index_3 = win_combination[2] # 2

  position_1 = board[win_index_1] # "X"
  position_2 = board[win_index_2] # "X"
  position_3 = board[win_index_3] # "X"

  if position_1 == position_2 && position_2==position_3 && position_1!=" "
    return win_combination
  end
end
   false
end
