WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
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

def move(board, position, character)
  board[position] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] != " "
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    return true
  elsif position_taken?(board, index) == true
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, character = "#{current_player(board)}")
    display_board(board)
  else
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
  end
end

def turn_count(board)
  turn_count = 0
  board.each do |position|
    if position == "X" || position == "O"
    turn_count += 1
    end
  end
  return turn_count
end

def current_player(board)
  if turn_count(board).even? == true
    return "X"
  else
    return "O"
  end
end

def won?(board)
   WIN_COMBINATIONS.detect do |win_combination|
     win_combination.all? do |win_combination_index|
       board[win_combination_index] == "X" ||
       win_combination.all? do |win_combination_index|
          board[win_combination_index] == "O"
       end
     end
   end
end

def full?(board)
  board.none? { |positions| positions == " "}
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end


def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? do |win_combination_index|
        board[win_combination_index] == "X"
      end
    end
    "X"
  elsif WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? do |win_combination_index|
        board[win_combination_index] == "O"
      end
    end
    "O"
  end
end


def play(board)
  until over?(board)
         turn(board)
         draw?(board)
    end
    if winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    elsif draw?(board)
      puts "Cats Game!"
    end

end
