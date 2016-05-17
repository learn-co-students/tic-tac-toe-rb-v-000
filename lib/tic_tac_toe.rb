WIN_COMBINATIONS =
    [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #bottom row
    [0,4,8], #right diag
    [2,4,6], #left diag
    [0,3,6], #left column
    [1,4,7], #mid column
    [2,5,8] #right col
    ]
    def display_board(board)
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
 #board = [" "," "," "," "," "," "," "," "," "]
 #display_board(board)
 #move
 def move(board, location, current_player = "X")
   board[location] = current_player(board)
 end

 def valid_move?(board,location)
    #define position variable and minus it since array starts at 0
    location.between?(0,8) && position_taken?(board,location) == false ?  #position is between range and position taken is
                                                                            #false.
   true : false
 end

 # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
 def position_taken?(board,location)
   board[location] != " " && board[location] != ""
 end

 def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   location = input.to_i - 1
   if valid_move?(board, location)
     move(board, location)
     display_board(board)
   else
     turn(board)
   end
 end

 def turn_count(board)
   counter = 0  #sets counter to 0
     board.each do |token|  #iterate board
      if token == "X" || token == "O"
        counter+=1
      end
    end
    counter
  end
 #method to check current player based on X being the first play ie even
  def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"  #from http://www.tutorialspoint.com/ruby/ruby_operators.htm
  end

  def won?(board)
    WIN_COMBINATIONS.find do |win|  # iterate over the winning combos and check tokens
      win.all? { |token| board[token] == "X"} || win.all? { |token| board[token] == "O"}
      end
    end

  def full?(board)
    !board.any? {|index| index == " "}
  end
 #check to see if draw using not won and full board
  def draw?(board)
    if !won?(board) && full?(board)
      return true
   else
     false
    end
  end
  #check to see if over with or operators
  def over?(board)
    if won?(board) || draw?(board) || full?(board)
      return true
    else
      return false
    end
  end

  def winner(board)  #find the winner
    if won?(board)
      won?(board).each do |value|   #value is X or O
        return board[value]
      end
    end
  end

  def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
