WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, position)
  board[position] == ' ' || board[position].nil? ? false : true
end

def valid_move?(board, position)
  !position_taken?(board, position) && position.between?(0, 8) ? true : false
end

def turn(board)
  puts 'Please enter 1-9:'
  input = gets.strip
  position = input_to_index(input)
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count { |input| input == 'X' || input == 'O' }
end

def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combos|
    if board[win_combos[0]] == board[win_combos[1]] && board[win_combos[1]] == board[win_combos[2]] && position_taken?(board, win_combos[0])
      return win_combos
    end
  end
  return false
end

def full?(board)
  board.all? {|filled| filled == 'X' || filled == 'O'}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) 
end

def winner(board)
  if win_combos = won?(board)
   return board[win_combos[0]]
  else
    return nil
  end
end

def play(board)
turn(board) until over?(board)
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat\'s Game!" 
  end
 end