
 WIN_COMBINATIONS = [
      [0,1,2], 
      [3,4,5], 
      [6,7,8], 
      [0,3,6], 
      [0,4,8], 
      [1,4,7], 
      [2,5,8], 
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
          input.to_i - 1
    end
    
    
      def current_player(board)
        if turn_count(board) % 2 == 0 
       return "X"
      else
       return "O"
      end
    end
     
     
      def move(board, index, current_player)
          board[index] = current_player
    end
      
      def position_taken?(board, index)
        if board[index] == " "
          return false
        elsif board[index] == ""
          return false
        elsif board[index] == nil
          return false
        else 
          return true
      end 
    end
 
 
      def valid_move?(board, index)
        if board[index] == "X" || board[index] == "O" || !index.between?(0,8)
          return false
        else
          return true
      end
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
    
      def turn_count(board)
          counter = 0
          board.each do |element| 
        if element == "X" || element == "O"
          counter += 1 
      end
     end
      return counter
    end


    def won?(board)
      WIN_COMBINATIONS.each do |win_combo|
        if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
          return win_combo
        elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
          return win_combo
        else
         false 
        end
      end
      false
    end
    
      def full?(board)
       board.all?{  |space| space == "X" || space == "O" } end
    
      def draw?(board)
        full?(board) && !won?(board)
    end
    
    def over?(board)
      won?(board) || draw?(board)
    end
    
      def winner(board)
        if won?(board)
          index = won?(board)[1] # writing the second time will call, so it can pull the arrays. The brackets will show which index in the array will have that value X or O. create a variable by equal it with an index within the won?(board)
          board[index]
        else nil
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