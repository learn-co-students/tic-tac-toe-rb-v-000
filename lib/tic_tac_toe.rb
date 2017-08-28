WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

#display board
def display_board(board = [" "," "," "," "," "," "," "," "," "])

        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

#input to index
def input_to_index(string)
  return string.to_i - 1
end

#move
def move(board, index, player)
  board[index] = player
end

#position taken
def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      return false
    elsif board[index] == "X" || "O"
      return true
  end
end

#valid move
def valid_move?(board, index)
  if !position_taken?(board,index) && index.between?(0,8)
    true
  else
    return false
  end
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
end

#turn count
def turn_count(board)
  board.count{|character| character == "X" || character == "O"}
  turns = 0
  board.each do |character|
    if character == "X" || character == "O"
      turns += 1
    end
  end
  turns
end

#current player
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

#won
def won?(board)
  WIN_COMBINATIONS.each do |win|
    win_index_1 = board[win[0]]
    win_index_2 = board[win[1]]
    win_index_3 = board[win[2]]

    if win_index_1 == "X" && win_index_2 == "X" && win_index_3 == "X"
      return win
    elsif win_index_1 == "O" && win_index_2 == "O" && win_index_3 == "O"
      return win
    end
  end
  false
end

#full
def full?(board)
    full_board = board.all? do |position|
      position == "X" || position == "O"
    end
  end

#draw
def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

#over
def over?(board)
  if draw?(board)
    true
  elsif full?(board)
    true
  elsif won?(board)
    true
  end
end

#winner
def winner(board)
    if won?(board) != false
      winner = won?(board)
      board[winner[0]]
  end
end

#play
def play(board)

  while !over?(board)
    turn(board)
  end



  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cats Game!"
  end
end
