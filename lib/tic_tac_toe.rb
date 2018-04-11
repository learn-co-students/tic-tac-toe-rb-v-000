WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]



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



def move(board, index, current_player)
  board[index] = current_player
end



def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end



def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board, index)
    puts "Please enter 1-9:"
    input = gets.strip
  else
    move(board, index, current_player(board))
    display_board(board)
    end
end



def turn_count(board)
  counter = 0
  board.each do |space|
    if (space == "X") || (space == "O")
      counter += 1
    end
  end
  counter
end



def current_player(board)
  if turn_count(board).even?
    "X"
  else turn_count(board).odd?
    "O"
  end
end



def won?(board)
  WIN_COMBINATIONS.detect do |wc|
    wi1 = wc[0]
    wi2 = wc[1]
    wi3 = wc[2]
    bi = [board[wi1],board[wi2],board[wi3]]
    (bi.all? {|x| x == "X"}) || (bi.all? {|o| o == "O"})
  end
end



def full?(board)
  if board.none? {|spaces| spaces == " "}
    TRUE
  else
    FALSE
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
    if board[won?(board)[0]] == "X" || board[won?(board)[0]] == "O"
      board[won?(board)[0]]
    end
  else won?(board)
  end
end



def play(board)
  until over?(board)
  turn(board)
end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end
  if draw?(board)
    puts "Cat's Game!"
  end
end
