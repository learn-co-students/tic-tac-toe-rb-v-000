

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  # ETC, an array for each win combination
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


def move(board, index, current_players)
  board[index] = current_players
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current_players = current_player(board)
  if valid_move?(board, index) == true
    move(board, index, current_players)
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  size = 0
  count = 0
  while size < board.length
    if board[size] != "" && board[size] != " "
    count = count + 1
   end
  size = size + 1
  end
 count
end

def current_player(board)
  flag = turn_count(board) % 2
  currnet_player = flag + 1
  if currnet_player == 1
    "X"
  else
    "O"
  end
end

def won?(board)
  draw_flag = 0
  if turn_count(board) != 0

   WIN_COMBINATIONS.each do |win_combination|
     x_flag = 0
     o_flag = 0
     win_combination.each do |win_combination_each|
       if position_taken?(board,win_combination_each)
          if board[win_combination_each] == "X"
               x_flag = x_flag + 1
               if x_flag == 3
                 return win_combination
               end

          elsif board[win_combination_each] == "O"
               o_flag = o_flag + 1
               if o_flag == 3
                 return win_combination
               end
          end
        end #position_taken
       end #combination

     end #combinations
    draw_flag = 1
  elsif turn_count(board) == 0
    false

  end #turn_count
 if draw_flag = 1
   false
 end
end # won

def full?(board)
  if turn_count(board) == 9
   true
 else
   false
 end
 end
def draw?(board)

  #  if won?(board) != true
  #    if full?(board) == true
  #          true
  #    else
  #         false
  #    end
  #  else
  #    false
  #  end

 !won?(board) && full?(board)

end

def over?(board)
  if full?(board) || draw?(board) || won?(board)
     true
  else
    false
  end
end

def winner(board)
  if won?(board)
    index = won?(board)
    position = index[0]
    return board[position]
  else
    nil
  end
end

def play(board)
   until over?(board)
     turn(board)
   end

  if won?(board) != false
      name = winner(board)
      puts "Congratulations #{name}!"
  end
  if draw?(board) == true
      puts "Cats Game!"
  end
end
