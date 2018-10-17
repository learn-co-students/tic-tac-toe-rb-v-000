WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def player_move(board, position, char)
  board[position] = char
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, position)
  if position.between?(0, 8)
    if board[position] == " " || board[position] == "" || board[position] == nil
        return true
      else
        return false
      end
  else
    return false
  end
end

def turn(board)

  input = gets.strip
  input_position = input_to_index(input)
  if valid_move?(board, input_position)
    player = current_player(board)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 1
  board.each do |position|
    if position == "X" || position == "0"
      turn += 1
    end
  end
    return turn
end

def current_player(board)
  third_move = turn_count(board)
  if third_move % 2 == 0
    correct_player = "X"
  else correct_player = "O"
  end
  return correct_player
end

def won?(board)
  WIN_COMBINATIONS.each {|winner|
    first = winner[0]
    second = winner[1]
    third = winner[2]

    first_position = board[first]
    second_position = board[second]
    third_position = board[third]

    if first_position == "X" && second_position == "X" && third_position == "X"
      return winner
    elsif first_position == "O" && second_position == "O" && third_position == "O"
      return winner
    end }
    return false
end

def full?(board)
  board.all? {|character| character == "X" || character == "O"}
end

def draw?(board)
    if !won?(board) && full?(board)
      return true
    else
      return false
    end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  position = []
  position = won?(board)
  if position == false
    return nil
  else
    if board[position[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
