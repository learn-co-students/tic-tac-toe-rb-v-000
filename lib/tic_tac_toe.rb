class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(position, token)
    @board[position] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
    @board.select{|spot| spot != " "}.length
  end

  def current_player
    if turn_count == 0
      return "X"
    end
    turn_count > 0 && turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
        return combo
      end
    end
  end

  def full?
    @board.all?{|spot| spot != " "}
  end

  def draw?
    @board.all?{|spot| spot != " "} && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    "Please enter 1-9"
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
