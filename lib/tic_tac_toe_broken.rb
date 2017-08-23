board = [" "," "," "," "," "," "," "," "," "]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

#temporary winning combination array to store values in board
T_W_C = [
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
  if board.empty?
    return false
  else
    T_W_C.each {|array|
      for index in 0..8 do
        position_taken?(board,index)
          for i in 0..2 do
            if array[i] == index
              array[i] = board[index]
            end
          end
      end
    }
  end

  indeX = T_W_C.find_index {|i| i == ["X","X","X"]}
  indeO = T_W_C.find_index {|i| i == ["O","O","O"]}

  if !indeX.nil?
    WIN_COMBINATIONS[indeX]
  elsif !indeO.nil?
    WIN_COMBINATIONS[indeO]
  else
    false
  end

end

def full?(board)
  if board.detect {|i| i == " "}
    return false
  else
    return true
  end
end
