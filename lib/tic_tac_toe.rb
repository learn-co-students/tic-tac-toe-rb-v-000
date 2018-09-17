def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts " -----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts " -----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
    index. between?(0,8) && position_taken?(board,index) == false
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
if valid_move?(board, index)
  move(board, index, token = current_player(board))
  display_board(board)
else
  puts "This is not a valid move."
  turn(board)
end
end

def turn_count(board)
  counter = 0

  board.each do |boardnum|

    if boardnum != " "
    counter += 1
    end
    end
counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return  "X"
  end
  if turn_count(board) % 2 == 1
  "O"
  end
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
  [0,1,2], #Top Hor WIN
  [3,4,5], #Mid Hor WIN
  [6,7,8], #Bot Hor WIN
  [0,3,6], #Left Vert WIN
  [1,4,7], #Mid Vert WIN
  [2,5,8], #Right Vert WIN
  [0,4,8], #DR Diag WIN
  [2,4,6], #DL Diag WIN
]

def won? (board)
  WIN_COMBINATIONS.each do |combo| # combo =[3, 4, 5]
    position = combo[0] #postion = 3
    position_2 = combo[1] #postion = 4
    position_3 = combo[2] #postion = 5

    cell = board[position] # "X" || "O"
    cell_2 = board[position_2]
    cell_3 = board[position_3]

    if cell == cell_2 && cell_2 == cell_3 && position_taken?(board, position)
      return true
    end
  end
  false
end

def full?(board)
  board.all? { |empty| empty != " "}
end

def draw?(board)
  if won?(board) == true
  return false
  end

  if full?(board) == true
  return true
  end
end

def over?(board)
  if draw?(board) == true
    return true
    end
  if won?(board) == true
    return true
    end

end


def winner(board)
  WIN_COMBINATIONS.each do |combo|
    position = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]

    cell = board[position]
    cell_2 = board[position_2]
    cell_3 = board[position_3]

    if cell == cell_2 && cell_2 == cell_3 && position_taken?(board, position)
    return "#{cell}"
    end
  end
  else
    return nil
    end


def play(board)
  while !over?(board) && !won?(board) && !draw?(board)
    turn(board)
  end

  if won?(board)
   puts "Congratulations #{winner(board)}!"
  end
  if draw?(board)
    puts "Cat's Game!"
  end

end
