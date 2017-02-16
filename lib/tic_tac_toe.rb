
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


def move(board, position, token)
  board[position] = token
end


def position_taken?(board, position)
  !(board[position] == nil || board[position] == " ")
end


def valid_move?(board, index)
  move = board[index]
  index > -1 && move != nil && move != "X" && move != "O"
end


def turn_count(board)
  num_of_turns = 0

  board.each do |space|
    if space == "X" || space == "O"
      num_of_turns += 1
    end
  end

  num_of_turns
end


def current_player(board)
  turns = turn_count(board)

  if turns % 2 == 0
    "X"
  else "O"
  end
end


def turn(board)
  statement = "Please enter 1-9:"
  puts statement

  player_move = input_to_index(gets.strip)

  if valid_move?(board, player_move)
    move(board, player_move, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end


def full?(board)
  !board.any?{|i| i == " "}
end


def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  won?(board) || draw?(board)
end


def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end


# def play(board)
#   turn(board)
#   if over?(board)
#     if draw?(board)
#       puts "Cats Game!"
#     else
#       puts "Congratulations player #{winner(board)}!"
#     end
#   else
#     play(board)
#   end
# end

def play(board)
 until over?(board)
   turn(board)
 end

 if draw?(board)
   puts "Cats Game!"
 else
   puts "Congratulations #{winner(board)}!"
 end
end
