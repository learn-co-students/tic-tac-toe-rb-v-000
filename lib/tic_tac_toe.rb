def display_board(board)

puts " #{board[0]} | #{board[1]} | #{board[2]} "

puts "-----------"

puts " #{board[3]} | #{board[4]} | #{board[5]} "

puts "-----------"

puts " #{board[6]} | #{board[7]} | #{board[8]} "

end



def valid_move?(board, index)

if index <0 || index >8

return false

elsif
board[index] == " "

return true

else return false

end

end



def input_to_index(input)

index = input.to_i

index = index - 1

return index

end



def move(board, index, xo)


board[index] = xo



display_board(board)



end



def turn(board)

puts "Please enter 1-9:"

input = gets.strip

index=input_to_index(input)
xo = current_player(board)

if valid_move?(board,index) == true

move(board,index,xo)



else turn(board)

end

end


def turn_count(board)
  count = 0
  board.each do |position|
    if position == "X"|| position == "O"
      count += 1
    end
  end
    return count
  end

  def current_player(board)
    count = turn_count(board)
    if count % 2 == 0
      return "X"
    else return "O"
    end
  end





# Helper Method

def position_taken?(board, index)

!(board[index].nil? || board[index] == " ")

end



# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]





def won?(board)

WIN_COMBINATIONS.each do |combo|


tempx = combo.all? do |number|

board[number] == "X"

end


tempo = combo.all? do |number|

board[number] == "O"

end


if tempx == true || tempo == true

return true

end

end

return false

end




def full?(board)


board.each do |number|

if number == nil or number == " "

return false

end

end

return true

end



def draw?(board)

if full?(board) == true && won?(board) == false

return true

else
return false

end

end



def over?(board)

if draw?(board) == true || won?(board) == true

return true

else return false

end

end




def winner(board)

WIN_COMBINATIONS.each do |combo|


tempx = combo.all? do |number|

board[number] == "X"

end


tempo = combo.all? do |number|

board[number] == "O"

end


if tempx == true

return "X"

elsif tempo == true

return "O"


end

end

return nil
end


def play(board)
until over?(board)
  turn(board)
  end
  if won?(board) == true
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
end
end
