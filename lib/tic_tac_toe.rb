def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, input, player= "X")
  board[input.to_i - 1 ] = player
end

def position_taken?(board, position)
  !(board[position] == " " || board[position].nil?)
end

def valid_move?(board, position)
  position_taken?(board, position.to_i-1) == false && position.to_i.between?(1, 9)
end

def turn(board)
  position = gets.strip
  until valid_move?(board, position)
    puts "That's not a valid move! Try Again"
    position = gets.strip
  end
  player = current_player(board)
  move(board, position, player )
  display_board(board)
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def turn_count(board)
  counter=0
    board.each do |element|
      if !(element.nil? ||element==" ")
        counter +=1
      end
    end
  counter
end

def won?(board)
  WIN_COMBINATIONS.each do |combination|
   if position_taken?(board, combination[0])
     if board[combination[0]] == board[combination[1]] && board[combination[1]]== board[combination[2]]
      return combination
     end
   end
  end
  false
end

def full?(board)
  board.all? do |taken|
    taken != " "
     end
end

def draw?(board)
  won?(board) == false
end

def over?(board)
    won?(board) || full?(board)
end

def winner(board)
  won?(board)
    WIN_COMBINATIONS.each do |combination|
      if position_taken?(board, combination[0])
        if board[combination[0]] == board[combination[1]] && board[combination[1]]== board[combination[2]]
          return board[combination[0]]
        end
      end
  end
nil
end

def play(board)
  until over?(board)
    turn(board)
    print "taking a turn"
  end
    if won?(board)
    puts "Congratulations #{winner(board)}"
  else
    puts "Cat's Game!"
  end
end


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
