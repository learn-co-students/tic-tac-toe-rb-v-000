WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  position = input.to_i - 1
end

def valid_move?(board, position)
  if position.between?(0,8) && !position_taken?(board, position)
        return true
  else
    return false
  end
end

def position_taken?(board, position)
  if (board[position] == " " || board[position] == "" || board[position] == nil)
    return false
  else
    return true
    end
    end

def move(board, position, char)
      board[position] = char
    end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  position = input_to_index(input)
  char = current_player(board)

  if valid_move?(board, position) == true
    move(board, position, char)
    display_board(board)
  else
    turn(board)
    end
end

def turn_count(board)
  counter = 0
  board.each do |space|
      if space == "X" || space == "O"
        counter += 1
    end
end
return counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  elsif turn_count(board).odd?
    return "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return win_combination
    end
  end
  false #How did this work here and not with else false?
end

def full?(board)
    if board.include?(" ")
      return false
    else
      return true
    end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
  if over?(board) == false
    return nil
  else WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return "X"
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return "O"
    end
  end
end
end


def play(board)
  until over?(board) == true || won?(board) != false
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else draw?(board) == true
    puts "Cats Game!"
  end
end
