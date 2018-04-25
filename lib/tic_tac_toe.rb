def play (board)
  while (over?(board) == false)
    turn(board)
  end
  if(won?(board))
    puts "Congratulations #{winner(board)}!"
  elsif(draw?(board))
    puts "Cat's Game!"
  end
end

def display_board (board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index (input)
  index = input.to_i - 1
end

def turn (board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  while(valid_move?(board, index) == false)
      puts "invalid"
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
  end

  move(board, index, current_player(board))
  display_board(board)

end

def turn_count (board)
  counter = 0
  board.each {|space| counter += 1 if (space != " " && space != "")}
  counter
end

def current_player (board)
 turn_count(board).odd? ? "O" : "X"
end

def move (board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move? (board, index)
 if (index.between?(0,8) && position_taken?(board, index) == false)
    return true
 else
    return false
 end
end

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

def won? (board)
  WIN_COMBINATIONS.each do |win|
    result = []
    win.each {|el| result << board[el]}
    if (result.all? {|x_pos| x_pos == "X"})
      return win
    elsif(result.all? {|o_pos| o_pos == "O"})
      return win
    end
  end
  return false
end

def full? (board)
 !board.include? (" ")
end

def draw? (board)
  !won?(board) && full?(board)
end

def over? (board)
  won?(board) || draw?(board)
end

def winner (board)
  if(won?(board) != false)
    final = won?(board)
    if(board[final[0]] == "X")
      return "X"
    elsif(board[final[0]] == "O")
      return "O"
    end
  else
    return nil
  end
end
