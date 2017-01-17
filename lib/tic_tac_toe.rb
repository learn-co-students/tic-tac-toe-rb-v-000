WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
[0,4,8], [2,4,6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

  def play(board)
    while !over?(board)
      turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cats Game!"
    end
  end

  def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)
    if valid_move?(board, position)
      move(board, position, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

  def move(board, position, player)
    board[position] = player
  end

  def position_taken?(board, position)
    !(board[position].nil? || board[position] == " ")
  end

  def valid_move?(board, position)
    position.between?(0,8) && !position_taken?(board, position)
  end

  def turn_count(board)
    board.count { |x| x == "X" || x == "O" }
  end

  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end

  def draw?(board)
    !(won?(board)) && full?(board)
  end

  def won?(board)
    WIN_COMBINATIONS.detect do |won|
      board1 = won[0]
      board2 = won[1]
      board3 = won[2]
     board[board1] == board[board2] && board[board2] == board[board3] && board[board2] != " "
    end
  end

  def full?(board)
    !board.include? " "
  end

  def over?(board)
    draw?(board) || won?(board)
  end

  def winner(board)
    if won?(board) == nil
       nil
    elsif board[won?(board)[0]] == "X"
       "X"
    elsif board[won?(board)[0]] == "O"
       "O"
    end
  end
