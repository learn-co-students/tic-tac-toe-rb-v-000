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


def input_to_index(input)
  input = input.to_i - 1
end



def position_taken?(board, index)
  board[index] == " " ? false : true
end


def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    return true
  end
  false
end


def turn_count(board)
  turns = 0
  board.each {|curr| curr != " " ? turns += 1 : turns = turns}
  return turns
end


def current_player(board)
  #player = ""
  return turn_count(board) % 2 == 0 ? "X" : "O"
  #return player
end


def move(board, index, token)
  board[index] = token
end


def won?(board)
  count = 0
  while count < WIN_COMBINATIONS.length
    win_combination = WIN_COMBINATIONS[count]

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      count += 1
    end
  end
  false
end


def full?(board)
  board.include?(" ") ? false : true
end


def draw?(board)
  if full?(board) && won?(board) == false
    return true
  end
  false
end


def over?(board)
  if won?(board).is_a?(Array)  || full?(board)
    return true
  end
  false
end


def winner(board)
  if won?(board).is_a?(Array)
    arr = won?(board)
    player = arr[0]
    return board[player]
  end
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip

  index = input_to_index(user_input)
  token = current_player(board)


  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
   else
    puts 'this position is either taken or invalid'
    turn(board)
  end
  #display_board(board)
end



def play(board)
  until over?(board) || won?(board) != false || draw?(board)
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    return nil
  end
end
