WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ];

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(board, index, char)
    board[index] = char
    return board
  end

  def position_taken?(board, index)
    if board[index] == "" || board[index] == " " || board[index] == nil
      return false
    elsif board[index] == "X" || board[index] == "O"
      return true
    end
  end

  def valid_move?(board, index)
    if position_taken?(board, index) || index > board.length || index < 0
      return false
    else
      return true
    end
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    elsif !valid_move?(board, index)
      turn(board)
    end
  end

  def turn_count(board)
    turns = 0
    board.each do |item|
      if item == "X" || item == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player(board)
    count = turn_count(board)
    if count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?(board)
    WIN_COMBINATIONS.each do |combo|
      index1 = combo[0]
      index2 = combo[1]
      index3 = combo[2]

      if board[index1] == "X" && board[index2] == "X" && board[index3] == "X"
        return combo
      elsif board[index1] == "O" && board[index2] == "O" && board[index3] == "O"
        return combo
      end
    end
    return false
  end

  def full?(board)
    board.all? { |item| item != " " }
  end

  def draw?(board)
    if full?(board)
      if !won?(board)
        return true
      elsif won?(board)
        return false
      end
    else
      return false
    end
  end

  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    else
      return false
    end
  end

  def winner(board)
    combo = won?(board)
    if combo
      index = combo[0]
      board[index]
    else
      return nil
    end
  end

  def play(board)
    while !over?(board)
      turn(board)
    end

    if over?(board)
      if won?(board)
        winner = winner(board)
        puts "Congratulations #{winner}!"
      elsif draw?(board)
        puts "Cats Game!"
      end
    end
  end
