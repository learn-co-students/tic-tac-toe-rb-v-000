#rspec spec/01_tic_tac_toe_spec.rb
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  (user_input.to_i) - 1
end

def move(board, input_to_index, player_character)
  board[input_to_index] = player_character
end

def position_taken? (board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
     false
   else
     true
   end
end

def valid_move?(board,index)
  if index.between?(0, 8) && !position_taken?(board,index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  player = current_player(board)
  if valid_move?(board,index)
    move(board,index,player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  number_of_turns = 0
  board.each do |current_space|
    if current_space == "X" || current_space == "O"
      number_of_turns += 1
    end
  end
  number_of_turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |winner_combination|
    win_index_1 = winner_combination[0]
    win_index_2 = winner_combination[1]
    win_index_3 = winner_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return winner_combination
    end
  end
  false
end


def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end


def draw?(board)
  if (full?(board)) & (!won?(board))
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end


def winner(board)
  if winning = won?(board)
    position = winning[0]
    return board[position]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    player = winner(board)
    puts "Congratulations #{player}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end


# def method_one(placeholder1, placeholder2, placeholder3)
#   puts placeholder1
#   puts placeholder2
#   puts placeholder3
# end
#
# def method_two(argumentTwo)
#   method_one(argumentOne)
# end
#
# rebeccas_name = "Rebecca"
# jacks_name = "Jack"
#
# def name_change(name)
#   puts name
# end
