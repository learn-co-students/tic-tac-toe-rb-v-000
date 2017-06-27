require 'pry'

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

def move(board, position, player_token)
  board[position] = player_token
  display_board(board)
end

def position_taken?(board, position)
  !!/(X|O)/.match(board[position])
end

def valid_move?(board, position)
  position >= 0 && position < board.length && !position_taken?(board, position)
end

def turn(board)
  puts "enter your position"
  position = input_to_index(gets.chomp)
  if !valid_move?(board, position)
    turn(board)
  else
    move(board, position, current_player(board))
  end
end

def turn_count(board)
  board.select{|position| position != " "}.length
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find{ |combo|
    position_taken?(board, combo[0]) &&
      board[combo[0]] == board[combo[1]] &&
      board[combo[0]] == board[combo[2]]
  }
end

def full?(board)
  turn_count(board) >= board.length
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end

def play(board)
  if over?(board)
    if !winner(board)
      puts "Cats Game!"
    else
      puts "Congratulations #{winner(board)}!"
    end
  else
    turn(board)
    play(board)
  end
end
