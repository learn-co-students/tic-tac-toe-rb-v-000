
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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

def move(board, index, character)
  board[index] = character

end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
if position_taken?(board, index) == false
  if index.between?(0, 10) == true
  true
end
elsif index.between?(0, 10) == false
  false
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index =input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end



  def turn_count(board)
  number_turns = 0
    board.each do |token|
      if token != " "
        number_turns += 1
  end
  end
  number_turns
  end

  def current_player(board)
    if turn_count(board) % 2 == 0
      "X"
    else "O"
    end
  end

  def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
        if  board[win_combination[0]] == board[win_combination[1]] &&
          board[win_combination[1]] == board[win_combination[2]] &&
          position_taken?(board, win_combination[0])

          return win_combination
        else
          false
        end
      end
  end

  def full?(board)
    all_full = true
    board.each do |position|
      if position == "X" || position == "O"
         all_full = true
       else
         all_full = false
      end
    end
    all_full
    end

    def draw?(board)
    !won?(board) && full?(board)
    end

    def over?(board)
      won?(board) || draw?(board) || full?(board)
    end

  def winner(board)
    if won?(board)
      win_combo = won?(board)
    return board[win_combo[0]]
    end
  end


def play(board)
  while  !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
