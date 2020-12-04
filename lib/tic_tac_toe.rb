#HELPER METHODS FOR TIC TAC TOE ARE CODED BELOW

#Win Combinations - Constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]


#Display Board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


#Input To index
def input_to_index(input)
  input.to_i - 1
end

#Move
def move(board, index, player)
  board[index] = player
end

#Position Taken?
def position_taken?(board, index)
  board[index] != " " ? true : false
end

#Valid Move
def valid_move?(board, index)
  index.to_i.between?(0,8) && position_taken?(board, index) == false ? true : false
end

#Turn
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets
  user_index = input_to_index(user_input)

  if valid_move?(board, user_index) == true
    character = current_player(board)
    move(board, user_index, character)
      return display_board(board)
  elsif valid_move?(board, user_index) == false
    turn(board)
  end
end

#Turn count
def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

#Current player
def current_player(board)
  turn_count(board).even? == true ? "X" : "O"
end

#Won
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end

#Full
def full?(board)
  board.none? { |index| index == " "}
end

#Draw?
def draw?(board)
  full?(board) && !won?(board)
end

#Over
def over?(board)
  won?(board) || full?(board) || draw?(board)
end

#Winner
def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |win_combo|
      position_1 = board[win_combo[0]]
      position_2 = board[win_combo[1]]
      position_3 = board[win_combo[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      else

      end
    end
  else
    return nil
  end
end

#Play
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
