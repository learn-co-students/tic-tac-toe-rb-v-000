WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [2,4,6],
  [3,4,5],
  [1,4,7],
  [0,4,8],
  [6,7,8],
  [2,5,8]
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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index > -1 && index < 9 && position_taken?(board, index) == false
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board, index) == true
      token = current_player(board)
      move(board, index, token)
    else
      turn(board)
    end
  display_board(board)
end

def turn_count(board)
  turns = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      turns += 1
    end
  end
  turns
end

def current_player(board)
  if turn_count(board) == 0
    return "X"
  elsif turn_count(board) == 1
    return "O"
  elsif turn_count(board).even?
    return "X"
  elsif turn_count(board).odd?
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
end
end

def full?(board)
  board.none? {|index| index == " "}
end

def draw?(board)
full?(board) == true && won?(board) == nil
end

def over?(board)
  draw?(board) == true || won?(board) != nil
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
  winner
end


def play(board)

  while over?(board) == false
    turn(board)
    won?(board)
    draw?(board)
  end
  won?(board)
    if won?(board)
    puts "Congratulations #{winner(board)}!"
    end
      if draw?(board)
      puts "Cat's Game!"
      end
end
