# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
win1 = [0,1,2]
win2 = [3,4,5]
win3 = [6,7,8]
win4 = [0,3,6]
win5 = [1,4,7]
win6 = [2,5,8]
win7 = [0,4,8]
win8 = [6,4,2]
WIN_COMBINATIONS = [win1, win2, win3, win4, win5, win6, win7, win8]

def won?(board)
  current = []
  someone_won = false
  WIN_COMBINATIONS.each do |win|
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      someone_won = true
      current = [win_index_1, win_index_2, win_index_3]
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      someone_won = true
      current = [win_index_1, win_index_2, win_index_3]
    else
      false
    end
  end
  if someone_won
    current
  else
    false
  end
end

def full?(board)
  if board.all? {|draw| draw == "X" || draw == "O"}
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if full?(board) == true || won?(board) != false
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
    nil
  else
    current = won?(board)
    board[current[1]]
  end
end
