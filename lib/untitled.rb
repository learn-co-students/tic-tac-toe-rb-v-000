
WIN_COMBINATIONS = 
  [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

def display_board(board)

   line= "-----------"
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts line
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts line
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def move(board, location, player = "X")
  board[location.to_i - 1] = player
end


def position_taken?(board,position)
  #board[location] != " " || board[location] != ""
  if (board[position.to_i] == " ") || (board[position.to_i] == "") 
    false
  elsif (board[position.to_i] == nil)
    false
  elsif (board[position.to_i] == "X") || (board[position.to_i] == "O") 
    true
  end
end

def valid_move?(board, position)
  #position.to_i.between(1,9) && !position_taken?(board, position.to_i - 1)
#end
 if position_taken?(board, position.to_i - 1)  
    false
  elsif (position.to_i.between?(1,9))
     true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input) 
    move(board, input)
  else
    turn(board)
  end
  display_board(board)
end


def turn_count(board)
  counter = 0
  board.each do |position|
  if (position == "X") || (position == "O")
   counter += 1
 end
end
counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
      WIN_COMBINATIONS.each do |position|
      if (board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X") || (board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O")
       return position
     end
   end
      false
    end
  
  def full?(board)
    status = true
  board.each do |element|
      if !won?(board) && (element == "X" || element == "O")
       status 
      elsif element == " " 
       status = false
      end
    end
    status
  end
  


  def draw?(board)
    d_status = false
    if (full?(board) && !won?(board))
      d_status = true
    end
    d_status
  end

  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    end
    false
  end

  def winner (board)
      winning_comination = won?(board)
      if winning_comination
      return board[winning_comination[0]]
  end
  nil
end

#def play(board)
  #input = gets
  #turn_count = 1
#while turn_count <= 9 do
  #turn(board)
  #turn_count += 1
#end
  #end


def play(board)
  winning_player = won?(board)
  while !over?(board) && turn_count(board) <= 9 do
    turn(board)
    if won?(board)
      puts "Congratulations #{winning_player}!"
    elsif draw?(board)
      puts "Cats Game!"
    end
  end
end
