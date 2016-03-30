WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],

                    [1,4,7], [2,5,8], [0,4,8], [6,4,2]

                   ]




def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "

  puts "----------- "

  puts " #{board[3]} | #{board[4]} | #{board[5]} "

  puts "----------- "

  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end




def move(board, location, player = "X")

  board[location.to_i - 1] = player

end




def position_taken?(board, location)

  !(board[location].nil? || board[location] == " ")

end




def valid_move?(board, position)

  input = position.to_i - 1

  input.between?(0, 8) && !position_taken?(board, input)

end




def turn(board)

  puts "Please enter 1-9: "

  input = gets.chomp

  if valid_move?(board, input)

    move(board, input, current_player(board))

  else

    puts "Sorry. Invalid move. Please try again. "

    turn(board)

  end

  display_board(board)

end




def turn_count(board)

  count = 0

  board.each do |b|

    count += 1 if b == "X" || b == "O"

  end

  count

end




def current_player(board)

  turn_count(board).even? ? player = "X" : player = "O"

end




def won?(board)

  WIN_COMBINATIONS.detect do |win_combo|

    win_combo.all? {|position| board[position] == "X"} ||

      win_combo.all? {|position| board[position] == "O"}

  end

end




def full?(board)

  board.none? {|position| position == " "}

end




def draw?(board)

  !won?(board) && full?(board)

end




def over?(board)

  won?(board) || draw?(board)

end




def winner(board)

  won?(board) ? board[won?(board)[0]] : nil

end




def play(board)

  until over?(board)

    turn(board)

  end

  if won?(board)

    puts "Congratulations #{winner(board)}!"

  elsif draw?(board)

    puts "Cats Game!"

  end

end
