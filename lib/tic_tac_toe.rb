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
 "#{user_input}".to_i - 1 #input converted to integer
end

def move(array,index,value)
  array[index] = value
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " " || board[location] == "")
end

def valid_move?(board, index)
  spot = index.to_i - 1
  if !position_taken?(board,index) && index.between?(0,8)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  boolCheck  = false

  while boolCheck == false
    input = gets.strip # convert the value
    location = input_to_index(input) #converted to integer

    if valid_move?(board,location) == false #value check forced entry
      puts "Not a valid move. Please try again."
    else
      boolCheck = true #exit the loop
      move(board,location,current_player(board))
      display_board(board)
    end
  end
end

# checks board to determine current turn number. 0-9
def turn_count(board)
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    end
  end
  return counter
end

# determines current turn
def current_player(board)
  turn_num = turn_count(board)
  if turn_num.even? == true
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each_with_index do |element,index|
    if position_taken?(board,element[0]) == true
      if board[element[0]] == board[element[1]] && board[element[1]] == board[element[2]]
        return WIN_COMBINATIONS[index]
      end
    end
  end
  return false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  won?(board) == false && full?(board)== true
end

def over?(board)
  while won?(board)
    if draw?(board) == true  || full?(board) == true
      return true
    elsif full?(board) == false
      return true
    end
  end
  if draw?(board) == true
    return true
  end
end

def winner(board)
  win_char = nil
  if !won?(board)
    return nil
  else
    win_char = board[won?(board)[0]]
  end
  return win_char
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board).class == Array
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
