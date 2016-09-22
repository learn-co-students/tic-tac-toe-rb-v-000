
def display_board(board)
  3.times do |i|
    3.times do |j|
        print " #{board[(i+j) + i*2]} #{j < 2 ? '|' : ''}"
    end
    if i < 2
        puts "\n-----------"
    end
  end
end

def input_to_index(i)
  i.to_i - 1
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, pos)
  pos >= 0 && pos <= 8 && !position_taken?(board, pos)
end

def turn(board)
  puts "Please enter 1-9:"
  move = input_to_index(gets)
  if valid_move?(board, move)
    move(board, move, current_player(board))
  else
    turn(board)
  end
end

def current_player(board)
  if turn_count(board).even?
    return 'X'
  else
    return 'O'
  end
end

def turn_count(board)
  board.select {|c| c != ' ' }.size
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    combo.all? {|c| position_taken?(board, c) && board[c] == board[combo[0]] }
  end
end


def full?(board)
  board.all? {|c| c != ' ' }
end


def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board)
end

def winner(board)
  if !won?(board)
    return nil
  end
  return board[won?(board)[0]]
end

def play(board)
  until over?(board) || won?(board) || draw?(board) do
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
