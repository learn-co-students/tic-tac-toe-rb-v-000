
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

  def move(board,pos,char)
    pos1 = pos.to_i - 1
    board[pos1] = char
    board
  end# code your move method here!

  def position_taken?(board,position)#code your #position_taken? method here!
    if board[position] == " " || board[position] == "" || board[position] == nil
      false
    elsif board[position] == "X" || board[position] == "O"
      true
    end
  end


  def valid_move?(board,position)
    pos = position.to_i
    if pos.between?(1,9) && !position_taken?(board,position.to_i - 1)
      true
    else
      false
    end
  end

  def turn(board)

  char = current_player(board)

   valid = 0
   while valid == 0
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(board,position) == true
      valid = 1
      move(board,position,char)
      display_board(board)
    end
   end
 end

 def turn_count(board)
   count = 0
   board.each do |item|
     if item == "X" || item == "O"
     count += 1
     end
   end
   count
 end

 def current_player(board)
   if turn_count(board) % 2 == 0
     "X"
  else
    "O"
  end
end

def won?(board)

  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? do |character|
    character == "X" || character == "O"
  end
end

def draw?(board)

  won?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end


def over?(board)
  if draw?(board) || won?(board) != false
    true
  else
    false
  end
end

def winner(board)
  if over?(board) && !draw?(board)
    board[(won?(board))[0]]
  else
    nil
  end
end

def play(board)
 while over?(board) == false
  turn(board)
 end
 if draw?(board) == true
    puts "Cats Game!"
  elsif won?(board) != false && won?(board)!= true
    puts "Congratulations #{board[won?(board)[0]]}!"
  end
end
