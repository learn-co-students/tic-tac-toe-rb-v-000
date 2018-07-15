

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

board = [" "," "," "," "," "," "," "," "," "]
display_board(board)


def input_to_index(index)
  input = index.to_i - 1

end


def move(array, index, value = "X")

  array[index] = value

end

def position_taken?(board, index)
    if board[index] == "X" || board[index] == "O"
     return true

    else index == " " || index == "" || index == "nil"
     return false
   end
end

def valid_move?(board, index)
    if index.between?(0, 8) && !position_taken?(board, index)
        return true
    else
        return false
    end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board, index, "X")
    display_board(board)
  else
    puts "Invalid move - please enter a valid move 1-9"
    turn(board)
  end
end

def turn_count(board)
  number_of_turns = 0
  board.each do |el|
    if el == "X" || el == "O"
      number_of_turns += 1
    end
  end
  number_of_turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else turn_count(board) % 2 == 1
      return "O"
    end
  end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  if board.all? {|square| square != " "}
    return true
  elsif   board.include?(" ") || board.empty? || board == ""
    return false
  end
end

def draw?(board)
 !won?(board) && full?(board)
end

def over?(board) #need draw
  if full?(board) || won?(board)
    return true
  end
end

def winner(board)
#should accept a board and return the token, "X" or "O" that has won the game given a winning board.
#find winning WIN_COMBINATIONS, use winning index to find X or O

  if  winning_combination = won?(board)
    board[winning_combination[0]]

  end
end

def play(board)
  amount_of_turns = 0
  while amount_of_turns < 9
    turn(board)
    amount_of_turns = amount_of_turns + 1
  end
end
