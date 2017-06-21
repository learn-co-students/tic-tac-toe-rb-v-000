#this is a constant containing all of the possible winning combinations for tic tac toe
WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #middle row win
  [6, 7, 8], #bottom row win
  [0, 3, 6], #left column win
  [1, 4, 7], #middle column win
  [2, 5, 8], #Right column win
  [0, 4, 8], #upper left to bottom right diagonal win
  [2, 4, 6]]  #upper right to bottom left diagonal win

#this is the method to print out the current board
def display_board(board)
    row_one = " #{board[0]} | #{board[1]} | #{board[2]} "
    row_two = " #{board[3]} | #{board[4]} | #{board[5]} "
    row_three = " #{board[6]} | #{board[7]} | #{board[8]} "
    separating_line = "-----------"

    puts row_one
    puts separating_line
    puts row_two
    puts separating_line
    puts row_three
  end

#this method takes in the user's input,
#changes it into an integer,
#checks to see if the number is 1 through 9
#and if it is converts it to its proper index number for the board array
# if their entered value is invalid it returns -1
  def input_to_index(input)
    input = input.to_i
    if (input >= 1 and input <= 9)
      input = input - 1
      return (input)
    else
      return (-1)
    end
  end

# this is the move method that actually updates the game board array with the correct value
  def move(board, position_index, player_token)
    board[position_index] = player_token
  end


#this method checks if the refered to position on the board is taken
  def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      return false
    else
      return true
    end
  end

#this method tests if the inputed position for the game board is a valid move or not
#it tests to see if the index value is correct and if the position is taken or not
  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def turn_count(board)
    turn_number = 0
    board.each do |space|
      if space == "X" || space == "O"
        turn_number += 1
      end
    end
    return turn_number
  end

  def current_player(board)
    if turn_count(board) % 2 == 0
      return "X"
    else
      return "O"
    end
  end


  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(board, index) == true
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

  def won?(board)
    WIN_COMBINATIONS.any? do |win_combination|  #iterating through the WIN_COMBINATIONS constant, to find any cases of true
      if win_combination.all? {|index| board[index] == "X"}
        return win_combination
      elsif win_combination.all? {|index| board[index] == "O"}
        return win_combination
      end
    end
  end

  def full?(board)
    board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?(board)
    !won?(board) && full?(board)
  end

  def over?(board)
    won?(board) || full?(board) || draw?(board)
  end

  def winner(board)
    if won?(board) == false
      return nil
    else
      WIN_COMBINATIONS.any? do |win_combination|  #iterating through the WIN_COMBINATIONS constant, to find any cases of true
        if win_combination.all? {|index| board[index] == "X"}
          return "X"
        elsif win_combination.all? {|index| board[index] == "O"}
          return "O"
        end
      end
    end
  end

  def play(board)
    while !over?(board)
      turn(board)
    end
    if over?(board)
      if draw?(board)
        puts "Cats Game!"
      else
        puts "Congratulations #{winner(board)}!"
      end
    end
  end
