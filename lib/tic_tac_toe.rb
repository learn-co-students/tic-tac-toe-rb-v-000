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

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  player_input = gets.strip
  player_index = input_to_index(player_input)

  if valid_move?(board, player_index)
    move(board, player_index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  turns = 0
  board.each do |position|
    if position == "X" || position == "O"
      turns += 1
    end
  end
  turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination| #pass winning pos permutations to test against board
    board[combination[0]] == board[combination[1]] && #do tokens in pos1 and pos2 match
    board[combination[1]] == board[combination[2]] && #do tokens in pos2 and pos3 match > transitive: all 3 combo pos match
    position_taken?(board, combination[0]) #are pos occupied and don't just match b/c empty
  end #auto fails if empty or no combinations made
end

def full?(board)
  board.all? {|position| position != " "} #for all pos in board not empty
end

def draw?(board)
  !won?(board) && full?(board) #not won and full
end

def over?(board)
  won?(board) || draw?(board) || full?(board) #won or draw or full
end

def winner(board)
  if winning_combination = won?(board) #assigns winning array [x, y, z] to var
    board[winning_combination[0]] #returns token in 0 index of winning array
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
