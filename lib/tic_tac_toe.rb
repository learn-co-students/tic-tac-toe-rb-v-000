require 'pry'
WIN_COMBINATIONS = [
  [0,1,2], # Top row, #had extra comma&deleted comma, #add comma to delineate element of array WIN_COMBINATIONS
  [3,4,5],  # Middle row, #add comma to delineate element of array WIN_COMBINATIONS
  [6,7,8],  # last row#add comma to delineate element of array WIN_COMBINATIONS
  [0,3,6], #first columns#add comma to delineate element of array WIN_COMBINATIONS
  [1,4,7],  #second columns#add comma to delineate element of array WIN_COMBINATIONS
  [2,5,8],  # third columns#add comma to delineate element of array WIN_COMBINATIONS
  [0,4,8],  #diagnoal from nw to se#add comma to delineate element of array WIN_COMBINATIONS
  [2,4,6],  #diagnoal from ne to sw#add comma to delineate element of array WIN_COMBINATIONS
  # ETC, an array for each win combination#add comma to delineate element of array WIN_COMBINATIONS
]
def input_to_index (user_input)
  user_input.to_i-1 #converts user_input argument to integer w .to_i
  #and to match board index position, subtracts 1 from converted user input integer
end
def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken? (board, index) # remember to check position_taken_spec.rb for syntax of the conditions
  #board = ["", "","X", "", "", "", "", "", "" ]
  if board[index] == "" || board[index] == " "|| board[index] == nil
    #if board index values are not comparable, hence, "empty string", "empty space", or "nothingness" i.e. nil are not comparable == to "X" then return
    false
  else #board[index] == "X" || "O"; hence, if board[index] value is comparable to "X" or "O" then return "true"
    true
  end
end
#############code your input_to_index and #############move method here!
def input_to_index (user_input)
  user_input.to_i-1 #converts user_input argument to integer w .to_i
  #and to match board index position, subtracts 1 from converted user input integer
end

def move (board, index, current_player) # localized variables used = "board, index,current_player"
  #Part of your #move method will mean updating the board array passed into it, which is
  board[index] = current_player #updated board entries
  #in one line w/ 3 arguments = placeholder for values in the bin/move file
  #remove space btwn board and its array values
  #rec'd error for not allowing default 3rd arguments
end
##################
# code your #valid_move? method here

def valid_move?(board, index)
# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
# remember to check position_taken_spec.rb for syntax of the conditions
    #binding.pry
    #checks to see user entered "index" value is comparable to "", " ", or nil
  if board[index] == " " && index.between?(0, 8)# index =>0 && index <=8 failed for short circuit evaluation
    true#print true if user entered value is one of 3 conditions r met, i.e user entered "", or " ", or nil
  elsif board[index] == "X" || board[index] == "O" #index <0
    #binding.pry
    false#print false if user has entered a position
  else
    false
  end
end
#turn
#NEED TURN METHODS here#######################################################
#ask for input
#get input
#convert input to index
#if move is valid
#  make the move for index and show board
#else
#  ask for input again until you get a valid move
#end
#define turn_count
#require 'pry'
def turn_count (board)
  #if only two occupied position, then player "o" made move
  #if only one occupied position, then player "x" made move
  counter = 0
#if board.each do |item| == "X", got sytax error, unexpected ==^ "X"
  board.each do |item|#iterate through board array element and pass each value to local variable item
    if item !=" "
    #if item !=""
    counter +=1
  #elsif item == "O"; worked
    #counter +=1; worked w/ line 23
  end
    end
  #desired outcome is number of turns that have been made by
  counter #why did this method missing an argument? when it's not here the each block returns the board array instead of a counter value
end

#define current_player
def current_player(board) # can't have a space b/f and use parenthesise to hold argument
  if turn_count(board) % 2 == 0 #failed to include turn_count method's argument (board) 1st x; worked after argument inclusion
    return "X"# is the correct line here for instructios states even #'s are to output string "X"'
#pry
    #return "X"#, no comma is allowed after the value "X" #returns nil. same as print nor put command.
    #instruction calls for X If the turn count is an even number, the `#current_player` method should return `"X"`, otherwise, it should return `"O"`.
  elsif turn_count(board) % 2 == 1
    #return "O" #1st x w/"X"-returned failure/error msg where it expected "X" & got "O"
    return "O"#,no comma is allowed #return nil. same as print nor put command
  end
  #return "X" #1st x w/ "O"-returned failure/error msg where it expected "X" & got "O"
end
#define won?
def won?(board) WIN_COMBINATIONS.find do |win| #FIND the 1 unique combination in the constant WIN_COMBINATIONS
  #binding.pry
    position_1 = board[win[0]]
    position_2 = board[win[1]]
    position_3 = board[win[2]]
    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      #|| position_1 == position_3
         return win
    #elsif position_1 == "X" && position_2 == "O" && position_3 == "X"
        #return true
        else
          false
    end
                        end
end
#define full?
def full?(board) #defines the full? method w/board array
  board.all? { |elem| # iterate through ALL of the board array
    elem == "X"  || elem == "O" || elem != " "#value is comparable to X OR O OR is not empty
  }
end
#define draw?
#accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full,
#and false if the board is won. You should be able to compose this method solely using the methods you used above with some ruby logic
def draw?(board)
  if !won?(board) && full?(board) # if not won board and not full board then
    true
  else
    false
  end
end

#define over?
def over?(board)
    if draw?(board) || won?(board) # if board is at draw or board is won
      true # then return true.
    else
      false
    end
end
#define winner
def winner(board)
  win = won?(board) #sets variable to return value
  return if win.nil? # solves for incident when win is nil, for when win is
  #nil, win[0] does not pass the spec test
  position_1 = board[win[0]] # assignment equality operator to extract
  #from parent board array value, located at its' child array ,win array, index 0
  position_2 = board[win[1]]
  position_3 = board[win[2]]
  #binding.pry
  if position_1 == "X"
    return "X"
  elsif position_1 == "O"
    return "O"
  else
    false
  end
end

def turn(board)
  #puts "Please enter 1-9:"
  input= gets.strip
  input= input_to_index(input) #missing input_to_index METHOD
  if valid_move?(board,input)
    #binding.pry
    move(board,input, current_player(board))
      # current_player argument inserted,
    #2nd x = current player removed,
    #3rd x = current_player(board)
    #binding.pry
    display_board (board)
  elsif
    turn(board) #here is the missing line for 9-12 pm (3 hrs) last nt and 9-11 am (2 hrs today), method calls itself is a new concept
  end
end
#PLAY METHOD###############################
def play(board)
  input = gets.strip
    while over?(board) != true
      # while board is NOT over,
      #for there is no draw nor win
      #current_player(board) # print current player (board)
      turn(board)
      #elsif over?(board) == true #
      #current_player(board)
      #turn(board)
      binding.pry
    end
#if the game was won
    if won?(board) == true
        return "congratulate the winner"
    elsif draw?(board) == true
        return "it has been a draw"
    end
end
