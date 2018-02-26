  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

   
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i-1
  end

  def move(board, index, token)
    board[index] = token
  end

   def position_taken?(board, index)
      board[index] == "X" || board[index] == "O"
   end

   def valid_move?(board, position)
    !position_taken?(board, position) && position.between?(0,8)
   end


    def turn_count(board)
      board.count{|token| token == "X" || token == "O"}
    end

     def current_player(board)
       turn_count(board) % 2 == 0 ? "X" : "O"
     end

  def turn(board)
    display_board(board)
    puts "Please pick a position between 1-9"
    user_input = gets.strip
     index = input_to_index(user_input)
        if valid_move?(board, index)
          move(board, index, current_player(board))
        else
          turn(board)
        end
   end

    def won?(board)
      WIN_COMBINATIONS.each do |combo|
        if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " " && board[combo[0]] != ""
          return combo
        end
        end
          return false
      end

  def full?(board)
    turn_count(board) == 9
  end


  def draw?(board)
    !won?(board) && full?(board)
  end

  def over?(board)
    draw?(board) || won?(board)
    
  end

  def winner(board)
    combo = won?(board)
    if combo 
      board[combo[0]]
    end
  end

  def play(board)
    until over?(board)
    turn(board)
    end
        if won?(board)
        puts "Congratulations #{winner(board)}!"
        else
        puts "Cats Game!"
        end
    end
