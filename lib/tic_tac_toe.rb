# Define your WIN_COMBINATIONS constant
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

  def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    index=input.to_i - 1
  end

  def move(board,index,current_player)
    board[index]=current_player
  end

  def position_taken?(board, index)
    (board[index] == "X" || board[index] == "O")
  end

  def valid_move?(board,index)
    !(position_taken?(board,index)) && index.between?(0,8)
  end

  def turn(board)
    puts "Please enter 1-9:"
    input=gets.strip
    index=input_to_index(input)
    current_player = current_player(board)
    if valid_move?(board,index)
      move(board,index,current_player)
      display_board(board)
    else turn(board)
    end
  end

  def turn_count(board)
    turn_counter = 0
    board.each do |position|
      if position == "X" || position == "O"
      turn_counter += 1
      end
    end
    turn_counter
  end

  def current_player(board)
  turn_counter = turn_count(board)
  turn_counter.even? ? current_player = "X" : current_player = "O"
  current_player
  end

  def won?(board)
        WIN_COMBINATIONS.find { |win_combo|
        winning_combo = win_combo
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")}
  end

  def full?(board)
    board.all?{|location| (location =="O" || location =="X")}
  end

  def draw?(board)
    !won?(board) && full?(board)
  end

  def over?(board)
    won?(board) || draw?(board) || full?(board)
  end

  def winner(board)
    if won?(board)
      index = won?(board)[0]
      board[index]
    end
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
