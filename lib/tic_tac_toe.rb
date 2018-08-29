board = [" ", " ", " "," ", " ", " "," ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)
display_board(board)
display_board(board)

WIN_COMBINATIONS =[
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]

def input_to_index(user_input)
  index = user_input.to_i - 1
end

current_player = "X" || "O"

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  board[index] == " " && index.between?(0,8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  elsif
    turn(board)
  end
end

def turn_count(board)
  r = 0
  counter = 0
  while r <= 9
    if board[r] == "X" || board[r] == "O"
      counter += 1
    end
    r += 1
  end
  counter
end


def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
    WIN_COMBINATIONS.each {|winning|
      index_0 = winning[0]
      index_1 = winning[1]
      index_2 = winning[2]

      position_1 = board[index_0]
      position_2 = board[index_1]
      position_3 = board[index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return winning
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return winning
      end
    }
    return false
  end

  def full?(board)
    board.all? {|index| index == "X" || index == "O"}
  end

  def draw?(board)
    if !won?(board) && full?(board)
      return true
    else
      return false
    end
  end

  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    else
      return false
    end
  end

  def winner(board)
    index = []
    index = won?(board)
    if index == false
      return nil
    else
      if board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play(board)

      while over?(board) == false
        turn(board)
      end

      if won?(board)
        puts "Congratulations #{winner(board)}!"
      elsif draw?(board)
        puts "Cat's Game!"
      end

  end
