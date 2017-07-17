WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]


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

  def move(board, index, player)
    board[index] = player
  end

  def position_taken?(board, index)
    board[index] != " " && board[index] != ""
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def turn(board)
    puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      player = current_player(board)
    if valid_move?(board, index) == true
      move(board, index, player)
      display_board(board)
    else
      turn(board)
    end
  end

  def turn_count(board)
    counter = 0
    board.each do |turns|
    if turns == "X" || turns == "O"
      counter += 1
  end
    end
    return counter
  end

  def current_player(board)
    if turn_count(board) % 2 == 0
       "X"
    else "O"
    end
  end

  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = board[win_index_1]
       position_2 = board[win_index_2]
       position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
           elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
       end
     end
    false
   end

   def full?(board)
     if board.any?{|a| a == " " || a == ""}
      false
     else true
    end
  end

  def draw?(board)
    full?(board) == true && won?(board) == false
  end

  def over?(board)
  won?(board) != false || draw?(board) == true
      end

  def winner(board)
     if won?(board) == false
       nil
 else won?(board).each do |position|
     return board[position]
     end
    end
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
