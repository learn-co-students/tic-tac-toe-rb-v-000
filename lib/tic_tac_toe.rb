def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    pos_1=combo[0]
    pos_2=combo[1]
    pos_3=combo[2]
    if board[pos_1] == board[pos_2] && board[pos_2] == board[pos_3] && board[pos_1] != " "
      return combo
    end
  end
  return false
end

def full?(board)
  board.none?{|i| i==" "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    combo = won?(board)
    winner = board[combo[0]]
    return winner
  else
    puts "Whatevs"
    return nil
  end
end

def turn_count(board)
  turn_count = 0
  board.each do |data|
    if data == "X" || data == "O"
      turn_count += 1
    end
  end
  return turn_count
end

def current_player(board)
  turn_count = turn_count(board)
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn(board, player="X")
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if !valid_move?(board, index)
    turn(board)
  end
  move(board,index,player)
  display_board(board)
end

def clear_screen
  puts "\e[H\e[2J"
end

def valid_move?(board, index)
  index >= 0 && index <= 8 && !position_taken?(board,index)
end

def position_taken?(board,index)
  board[index] == "X" || board[index] == "O"
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  return index
end

def move(board,index,player)
  board[index] = player
end

def play(board)
  player= "X"
  turn_count= 0
  while turn_count <9
    if over?(board)
      break
    end
    player = current_player(board)
    turn_count = turn_count(board)
    turn(board, player)
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
