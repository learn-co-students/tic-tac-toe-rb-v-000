WIN_COMBINATIONS = [
 top_row_win = [0,1,2],
 middle_row_win = [3,4,5],
 bottom_row_win = [6,7,8],
 left_column_win = [0,3,6],
 middle_column_win = [1,4,7],
 right_column_win = [2,5,8],
 left_diagonal_win = [0,4,8],
 right_diagonal_win = [2,4,6] ]

 def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

 def input_to_index(input)
   input = input.to_i
   input = input - 1
 end

 def move(board, position, char)
     board[position] = char
     puts board
 end

 def position_taken?(board, index)
      if board[index] == " " || board[index] == "" || board[index] == nil
      false
    elsif board[index] == "X" || board[index] == "O"
      true
    end
 end

 def valid_move?(board,index)
     if position_taken?(board,index) == true || index.between?(0,8) == false
     false
   else
     true
   end
 end

 def turn(board)
    current = current_player(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index) == true
      move(board, index, current)
    else
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
   end
    display_board(board)
  end

  def turn_count(board)
    count = 0
    board.each do |space|
        if space == "X"
            count += 1
          elsif space == "O"
            count += 1
        end
      end
    count
  end

  def current_player(board)
     if turn_count(board).odd? == false
       return "X"
     elsif turn_count(board).odd? == true
        return "O"
    end
  end




  def won?(board)
    won = false
     WIN_COMBINATIONS.detect do |win_combo|
      if board[win_combo[0]] == "X" &&
        board[win_combo[1]] == "X" &&
        board[win_combo[2]] == "X"
        won = true
       return win_combo
      elsif board[win_combo[0]] == "O" &&
        board[win_combo[1]] == "O" &&
        board[win_combo[2]] == "O"
        won = true
        return win_combo
      else
        won = false
      end
      end
    if won == false
      return won
    else
    end
  end

  def full?(board)
      index =[0,1,2,3,4,5,6,7,8]
      full = true
      index.detect do |num|
      if board[num].nil? || board[num] == " "
       full = false
      end
    end
    return full
  end

  def draw?(board)
    if full?(board) == true && won?(board) == false
      return true
    elsif won?(board) == false
      return false
    end
  end


  def over?(board)
     if draw?(board) == true
       return true
     elsif won?(board) != false
       return true
     else
       return false
     end
  end

  def winner(board)
     winner = won?(board)
     if winner == false
       return nil
    end
     if board[winner[0]] == "X"
       return "X"
     elsif board[winner[0]] == "O"
       return "O"
     end
  end

  def play(board)
  while over?(board) == false
    turn(board)
  end
  winner = winner(board)
  if won?(board) != false
   puts "Congratulations #{winner}!"
  end
  if draw?(board) == true
    puts "Cats Game!"
  end
end
