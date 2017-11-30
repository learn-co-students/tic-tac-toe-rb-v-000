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

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] != " "
    true
  end
end

def valid_move?(board, index)
  index.between?(0,8) && position_taken?(board, index) == false
end

def turn(board)
  puts "Please enter 1-9:"

  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns_played = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns_played += 1
    end
  end
  return turns_played
end

def current_player(board)
  turns = turn_count(board)
  if turns % 2 == 0
  # if turns.even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  else
    false
  end

  def full?(board)
    board.all? do |winner|
      winner == "X" || winner == "O"
    end
  end

  def draw?(board)
    full?(board) && !won?(board)
  end


  def over?(board)
    draw?(board) || won?(board)
  end

  def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    else
      nil
    end
  end

  def play(board)
    until over?(board) do
      turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cat's Game!"
    end
  end
