
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

def display_board(board) 
  puts " #{board[0]} | #{board[1]} | #{board[2]} " 
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} " 
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def move(board, index, xOrO)
  board[index] = xOrO
end

def position_taken?(board, index)
  board[index] == ' ' ?  false :  true
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8) ?  true :  false
end

def turn(board)
  okayMove = false
  while (!okayMove)
    puts "What move would you like to make?"
    input = gets.chomp
    input = input_to_index(input)
    if (valid_move?(board, input) != false)
      okayMove = true
    end
  end 
  board[input] = current_player(board)
end

def turn_count(board)
  count = 0
  board.each do |xOrOOrBlank|
    if ( xOrOOrBlank == "X" || xOrOOrBlank == "O" )
      count += 1
    end
  end
  return count
end

def current_player(board)
  ( ( turn_count(board) % 2 ) == 0 ) ? "X" :  "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all? { |position| board[position] == "X" } ||
      combo.all? { |position| board[position] == "O" }
      return combo
    end
  end
  return false
end

def full?(board)
  board.each do |position|
    if ( position == " " )
      return false
    end
  end
  return true
end

def draw?(board)
   ( !( won?(board) ) && full?(board) )  ? true : false
end

def over?(board)
  draw?(board) || won?(board) || full?(board)  #slightly repetitive with full and draw both being here
end

def winner(board)
  aWin = won?(board)
  if (aWin == false)
    return nil
  else 
    return board[aWin[0]]
  end
end

def play(board)
  while ( !(over?(board) ) )
    turn(board)
  end
  theWinner = winner(board)
  if (theWinner != nil)
    puts "Congratulations #{theWinner}!"
  else
    puts "Cats Game!"
  end
end