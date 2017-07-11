WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]


def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index = index.to_i-1
end


def move(board, index, player)
  board[index] = player
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board,index)
  if position_taken?(board,index) == true  || index.between?(0,8) != true
    false
  else true
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(board,index)
    move(board,index, current_player(board))
    display_board(board)
  else puts "Space taken or invalid - Choose another number from 1-9"
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |space|
      if space == "X" || space == "O"
            counter+= 1
      end
  end
      counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
     "X"
  else  "O"
  end
end


def won?(board)
 WIN_COMBINATIONS.find do |combo|
        board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(board, combo[0])
      end
    end

  def full?(board)
    board.all? do |token|
    token == "X" || token == "O"
      end
    end

  def draw?(board)
      full?(board) && !won?(board)
    end

  def over?(board)
    won?(board) || draw?(board)
  end

  def winner(board)
    if won?(board)
      board[won?(board)[0]]

    end
  end


def play(board)
  until over?(board)
    turn(board)
  end

  if winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    elsif draw?(board)
      puts "Cats Game!"
  end
end
