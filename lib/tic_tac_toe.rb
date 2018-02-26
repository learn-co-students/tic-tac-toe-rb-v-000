WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-------------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-------------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(pos)
  pos.to_i - 1
end

def move(board, idx, char)
  board[idx] = char
end

def turn_count(board)
  count = 0
  board.each_with_index do |el, idx|
    if position_taken?(board, idx)
       count += 1
    end
  end
  count
end

def current_player(board)
  count = turn_count(board)
  count.even? ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  pos = gets.strip
  idx = input_to_index(pos)
  if valid_move?(board, idx)
    move(board, idx, current_player(board))
    display_board(board)
  else
    turn(board)
  end

end

def valid_move?(board, idx)
  idx >= 0 && idx <= 8 && !position_taken?(board, idx)
end

def full?(board)
  board.all? {|el|  !(el.nil? || el == " ")}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end


def empty_board?(board)
  board.each_with_index do |el, i|
    if position_taken?(board, i)
      return false
    end
  end
  true
end

def won?(board)
  if empty_board?(board)
    return false
  end
  x_board = []
  board.each_with_index do |el, i|
    if el == "X"
      x_board << i
    end
  end
  o_board = []
  board.each_with_index do |el, i|
    if el == "O"
      o_board << i
    end
  end
  WIN_COMBINATIONS.detect  do |win_comb|
    win_comb.all? {|el| x_board.include?(el)} || win_comb.all? {|el| o_board.include?(el)}
  end
end

def winner(board)
  won?(board).nil? ? nil : board[won?(board)[0]]
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
