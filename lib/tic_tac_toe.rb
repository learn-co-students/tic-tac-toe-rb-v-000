WIN_COMBINATIONS =
   [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [6,4,2]
   ]

 $WINNER

   def display_board(board)
     puts " #{board[0]} | #{board[1]} | #{board[2]} "
     puts "-----------"
     puts " #{board[3]} | #{board[4]} | #{board[5]} "
     puts "-----------"
     puts " #{board[6]} | #{board[7]} | #{board[8]} "
   end

  def input_to_index(index)
    cell = index.to_i - 1
     return cell
  end

   def move(board, index, player)
     board[index] = player
   end

   def position_taken?(board, index)
     if board[index] == "X" || board[index] == "O"
         return true
      else
         return false
       end
  end

   def valid_move?(board, pos)
     if pos >= 0 && pos <= 8 && position_taken?(board, pos) == false
       return true
     else
       return false
     end
   end

   def turn(board)
    puts "Specify a position by entering 1-9"
    input = gets.strip
     position = input_to_index(input)
     player = current_player(board)

     if valid_move?(board, position)
       move(board, position, player)
      display_board(board)
     else
       turn(board)
     end
   end


   def full?(board)
     if board.include?(" ")
       return false
    else
       return true
     end
  end

   def draw?(board)
     if won?(board) == false && full?(board) == true
         return true
    elsif full?(board) == false && won?(board) == false
         return false
    end
  end

  def over?(board)
     if won?(board) || draw?(board) || full?(board)
       return true
     else
       return false
     end
   end

   def winner(board)
     if won?(board) != false
       $WINNER
    else
       return nil
     end
  end

   def won?(board)
     value = nil
     WIN_COMBINATIONS.each do |combination_array|

         puts combination_array
         win_1 = combination_array[0]
         win_2 = combination_array[1]
         win_3 = combination_array[2]

        position_1 = board[win_1]
        position_2 = board[win_2]
        position_3 = board[win_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          value = combination_array# return the win_combination indexes that won
          $WINNER = "X"
          break
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          value = combination_array # return the win_combination indexes that won.
          $WINNER = "O"
           break

        else
           value = false
         end
       end
       value
   end


   def turn_count(board)
       count = 0
       board.each do |cell|
         if cell == "X" || cell == "O"
           count = count + 1
         end
       end
      return count
    end


     def current_player(board)
           if turn_count(board) % 2 == 0
             return "X"
           else
             return "O"
           end
         end

   def play(board)
     while over?(board) == false
        turn(board)
        won?(board)
      end
      if won?(board) != nil
        puts "Congratulations #{winner(board)}!"
     end
      if draw?(board)
        puts "Cats Game!"
      end

    end
