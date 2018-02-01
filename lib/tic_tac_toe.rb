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

def input_to_index(input)
  input = input.to_i
  index = input - 1
  return index
end

def move(board, index, character)
  board[index] = character
  return board
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  else
    return false
  end
end

  def valid_move?(board, index)
    if index >= 0 && index <=8
      if position_taken?(board,index) == false
        return true
      end
    end
    return false
  end

def turn(board)
  valid_move = false
  until valid_move == true
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    valid_move = valid_move?(board, index)
  end
  move(board,index, current_player(board))
  display_board(board)
end

def turn_count(board)
counter = 0
  board.each do |move|
    if move != " "
      counter += 1
    end
  end
  return counter
end


def current_player(board)
  number_of_turns = turn_count(board) % 2
  number_of_turns == 0 ? "X" : "O"
end


def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
      board[win_combination[0]] == board[win_combination[1]] &&
      board[win_combination[1]] == board[win_combination[2]] &&
      position_taken?(board, win_combination[0]) == true
  end
end

def full?(board)
  board.all? do |currentMove|
    currentMove != " "
  end
end

def draw?(board)
  draw = !won?(board) && full?(board)
  draw ? true : false
end

def over?(board)
  over = (won?(board) || draw?(board))
  over ? true : false
end

def winner(board)
  winner = won?(board)
  if winner == nil
    return nil
  else
    return  board[winner[0]]
  end
end


def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
