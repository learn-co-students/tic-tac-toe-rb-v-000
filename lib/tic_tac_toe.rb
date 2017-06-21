
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,4,8],
  [2,4,6],

  [0,3,6],
  [1,4,7],
  [2,5,8]
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  user_input = user_input.to_i - 1;
  user_input;
end

def move(board, position, player_token)
  board[position] = player_token;
  board;
end

# code your #position_taken? method here!
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false;
  elsif board[index] == "X" || board[index] == "O"
    return true;
  end
end

# code your #valid_move? method here
def valid_move?(board, index)
  if position_taken?(board, index) || board[index] == nil
    return false;
  elsif index > 8 || index < 0
    return false;
  elsif !position_taken?(board, index)
    return true;
  end
end

def turn(board, player_token="X")
  puts "Please enter 1-9:"
  index = gets.strip;
  index = input_to_index(index);
  if valid_move?(board, index)
    move(board, index, player_token);
  else
    until valid_move?(board, index) && (player_token == "X" || player_token == "O")
      puts "Please enter 1-9:";
      index = gets.strip;
      index = input_to_index(index);
    end
    move(board, index, player_token);
  end
  puts "Moved #{player_token} to #{index}!"
  display_board(board);
end

def current_player(board)
  occupied_positions = turn_count(board);
  if occupied_positions % 2 == 0
    return "X";
  else
    return "O";
  end
end

def turn_count(board)
  occupied_positions = 0;
  i = 0;
  while i < 9 do
    if board[i] == "X" || board[i] == "O"
      occupied_positions += 1;
    end #endif
    i += 1;
  end # end until
  return occupied_positions;
end#end foo



#win
def won?(board)
  empty_board = board.all? do |cell|
    cell == " ";
  end
  found_win = WIN_COMBINATIONS.detect do | combo |
    (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ) || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" )
  end
  if found_win == nil || empty_board
    return false
  else
    return found_win
  end
end


def full?(board)
  full_board = board.all? do | slot |
    slot == "X" || slot == "O"
  end
  return full_board;
end

def draw?(board)
  if won?(board)
    return false;
  elsif full?(board)
    return true;
  else
    return false;
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
  winning_coords = won?(board)
  if winning_coords != false
    if board[winning_coords[0]].include?("X");
      return "X";
    elsif board[winning_coords[0]].include?("O")
      return "O";
    else
      return nil;
    end# endif X | Y | nil
  end# endif boolean
end


def play(board)
  while !over?(board)
    player_token = current_player(board);
    turn(board, player_token);
  end
  token_winner = winner(board);
  if token_winner == "X"
    puts "Congratulations X!";
  elsif token_winner == "O"
    puts "Congratulations O!";
  else
    puts "Cats Game!";
  end
end
