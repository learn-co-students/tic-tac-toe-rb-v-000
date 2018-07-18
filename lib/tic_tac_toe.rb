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

def move(board, index, char = "X")
  board[index] = char
end
def turn_count(board)
  counter = 0
  board.each do |el|
    if (el.include?("X") || el.include?("O"))
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board) %2 == 0 ? player = "X" : player = "O"
  player
end

require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def won?(board)
  WIN_COMBINATIONS.each do |win_move|
  win_index_1 = win_move[0]
  win_index_2 = win_move[1]
  win_index_3 = win_move[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_move
  end
  end
else
  false
end

  def full?(board)
    !board.any? { |x| x == " " }
  end

  def draw?(board)
    if  !won?(board) && full?(board)
    puts "the game has been won"
      return true
    else
      puts "the game has not been won"
  return false
    end
  end

def over?(board)
if  full?(board) || won?(board) || draw?(board)
  puts "THE GAME IS OVER"
  return true
else
  puts "the game is not over"
  return false
end
end

  def winner(board)
    if winner = won?(board)
      board[winner.first]
    end
  end
  def valid_move?(board, index)
     index.between?(0,8) && !position_taken?(board, index)
  end

  def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
       return false
     elsif board[index] == "X" || board[index] == "O"
       return true
     end
   end
   def position_taken? (board, index)
      if board[index] == "X" || board[index] == "O"
        return true
      elsif board[index] != "  "
        return false
      elsif board[index] == " string "
        return true
      end
   end
   def input_to_index(user_input)
     user_input.to_i - 1
   end

   def move(board, index, current_player = "X")
     board[index] = current_player
   end

   def position_taken?(board, location)
     board[location] != " " && board[location] != ""
   end

   def valid_move?(board, index)
     index.between?(0,8) && !position_taken?(board, index)
   end

   def turn(board)
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(board, index)
       move(board, index)
       display_board(board)
     else
       turn(board)
     end
   end

   def play(board)
     turn = 0
     while turn < 9
       turn(board)
       turn += 1
   end
   end
