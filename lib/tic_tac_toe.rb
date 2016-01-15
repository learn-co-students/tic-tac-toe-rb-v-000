WIN_COMBINATIONS = [
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input) && turn_count(board).even? == true
    move(board, input, "X")
  elsif valid_move?(board, input) && turn_count(board).odd? == true
    move(board,input, "O")
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  total = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
    total +=1
    end
  end
  return total
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
WIN_COMBINATIONS.each do |combos|
  if combos.all? {|possible| board[possible] == "X"} || combos.all?{|possible| board[possible] == "O"}
    return combos
    end
  end
return false
end

def full?(board)
  board.none? {|spots| spots == " "}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
  return false
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
  player = won?(board)

    if won?(board) == false
    return nil
  end

  if board[player[0]] == "X"
    return "X"
  else
    return "O"
  end
end

def play(board)
until over?(board) == true
  turn(board)
  end


  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cats Game!"
  end
end