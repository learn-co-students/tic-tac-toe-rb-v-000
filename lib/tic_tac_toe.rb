
WIN_COMBINATIONS =
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]

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

  def position_taken?(board, location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def turn(board)
    puts "Please enter number between 1 and 9"
    input = gets.strip
    index = input_to_index(input)
    current_player = current_player(board)
    if valid_move?(board, index)
      move(board, index, current_player)
      display_board(board)
    else
        turn(board)
    end
  end

  def turn_count(board)
    number_of_turns = 0
    count = 0

    while count <= board.length - 1
      if (board[count] == "X" || board[count] == "O")
        number_of_turns += 1
      end
      count += 1
    end
    return number_of_turns
  end

  def current_player(board)
    if turn_count(board).odd?
      return "O"
    else
      return "X"
    end
  end

  def won?(board)
    WIN_COMBINATIONS.find do |win_combo|
      board[win_combo[0]] == board[win_combo[1]] &&
      board[win_combo[0]] == board[win_combo[2]] &&
      position_taken?(board, win_combo[1])
    end
  end

  def full?(board)
    board.none? do |space|
      space == " " || space.nil? || space == ""
    end
  end

  def draw?(board)
    won?(board) == nil && full?(board) == true
  end

  def over?(board)
    draw?(board) == true || won?(board) != nil
  end

  def winner(board)
    if won?(board) != nil
      winner = board[won?(board)[0]]
    end
  end

def play(board)
  while !(over?(board))
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
