
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

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board,index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board,index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  input = input_to_index(user_input)
    if valid_move?(board,input)
      move(board, index, char = "X")
      display_board(board)
    else
      turn(board)
    end
  end

  def turn_count(board)
    count = 0
    board.each do|space|
      if space == "X" || space == "O"
        count +=1
      end
    end
    count
  end

  def current_player(board)
    if turn_count(board) % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?(board)
  WIN_COMBINATION.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[3]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        win_combination
      elsif position_1 == "0" && position_2 == "O" && position_3 == "O"
        win_combination
      else
        false
      end
    end
  end

  def full?(board)
    board.all? do |elements|
      if elements != " "
        true
      else
        false
      end
    end
  end

  def draw?(board)
    if won?(board)
      false
    elsif !full?(board)
      false
    else
      true
    end
  end

  def over?(board)
    if draw?(board)
      true
    elsif won?(board)
      true
    else
      false
    end
  end

  def winner(board)
    if win_combo = won?(board)
      board[win_combo[0]]
    end
  end

                                               
