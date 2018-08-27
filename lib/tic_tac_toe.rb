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

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (input)
  index = input.to_i
  index -= 1
  return index
end

def move (board, index, pcharacter)
  board[index] = pcharacter
  return board
end

def position_taken? (board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move? (board, index)
  index >=0 && index <=8 && !position_taken?(board, index)
end

def turn (board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    play_index = current_player(board)
    move(board, index, play_index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count (board)
  turnc = 0
  board.each do |index|
    if index == "X" || index == "O"
       turnc +=1
    end
  end
  return turnc
end

def current_player (board)
  who_turn = turn_count (board)
    if who_turn % 2 == 0
      player = "X"
    else
      player = "O"
    end
    return player
end

def won? (board)
  WIN_COMBINATIONS.each {|win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board [win_index_1]
     position_2 = board [win_index_2]
     position_3 = board [win_index_3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
     end
   }
   return false
end

def full? (board)
  board.all? {|x| x == "X" || x == "O"}
end
def draw? (board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over? (board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner (board)
  index = []
  index = won? (board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
     return "X"
    else
     return "O"
    end
  end
end

def play (board)
  board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  until over?(board) == true do
    turn(board)
  end # of until
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "It is a draw."
  end # of if
end #of play
