def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
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

def input_to_index (user_input)
  user_input.to_i- 1
end

def player_move(board, index, player_token)
  board[index] = player_token
end

  def position_taken?(board, index)
    if board[index] == " " || board[index] == ''
      return false
    else
      return true




  #   !(board[index].nil? || board[index] == " ")
  # end

#   def position_taken?(board, location)
#   board[location] != " " && board[location] != ""
# end

  def valid_move? (board, index)
  if board[index] == " "
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    puts "Please enter 1-9:"
    turn(board)
  end
end

def turn_count (board)
  counter = 0
    board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
  end
  return counter
end

def current_player (board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end

def won?(board)
   WIN_COMBINATIONS.detect do |win|
    board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X" ||
    board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
  end
end

# START HERE
def full?(board)
  if board.all? {|space| space == "X"  || space == "O"}
      return true
  else
      return false
    end
  end

  def draw?(board)
      if board.all? {|index| index == "X" || index == "O" && !won?(board)}
          return true
        else
          return false
        end
      end

      def over?(board)
      if won?(board) || draw?(board) || full?(board)
        return true
      else
        return false
      end
    end


  def winner(board)
      if won?board
        return board[won?(board)[0]]
      else
        return nil
      end
    end

    def play(board)
    i = 0
    while i < 9
      turn(board)
    i +=1
    end
  end
