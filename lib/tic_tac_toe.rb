WIN_COMBINATIONS =
  [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

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

  def turn_count(board)
    counter = 0
    board.each do |token|
    if token == "O" || token == "X"
     counter += 1
   end
    end
    counter
  end

  def current_player(board)
    if turn_count(board) % 2 == 0
      "X"
    else
      "O"
    end
  end


  def position_taken?(board, location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

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

  # Define your play method below
  def play(board)
   turn(board) until over?(board)
   if won?(board)
     puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
     puts "Cat's Game!"
   end
  end

  def won?(board)
      WIN_COMBINATIONS.each do |positions|
        win_index_0 = positions[0]
        win_index_1 = positions[1]
        win_index_2 = positions[2]
        if board[positions[0]] == "X"  && board[positions[1]] == "X" &&  board[positions[2]] == "X"
          return positions
        elsif board[positions[0]] == "O"  && board[positions[1]] == "O" &&  board[positions[2]] == "O"
          return positions
        end
      end
      false
  end

  def full?(board)
    board.all? do |positions|
        positions == "O"  || positions == "X"
    end
  end

  def draw?(board)
  !won?(board) && full?(board)

  end

  def over?(board)
  won?(board) || full?(board) || draw?(board)
  end

  def winner(board)
  win_combination = won?(board)
  if won?(board)
  board [win_combination[0]]
  end
  end
