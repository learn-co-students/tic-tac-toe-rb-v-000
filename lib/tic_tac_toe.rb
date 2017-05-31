
#board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

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

def display_board(arr)
    puts " #{arr[0]} | #{arr[1]} | #{arr[2]} "
    puts "-----------"
    puts " #{arr[3]} | #{arr[4]} | #{arr[5]} "
    puts "-----------"
    puts " #{arr[6]} | #{arr[7]} | #{arr[8]} "
end

def input_to_index(input)
    n = input.to_i
    n - 1
end

def move(arr, index, char)
  arr[index] = char
end

def position_taken?(arr, index)
  arr[index] == ' ' || arr[index] == '' ? false : true
end

def valid_move?(arr, index)
  index.between?(0, 8) && !position_taken?(arr, index) ? true : false
end

def turn(arr)
  puts "Please enter 1-9: "
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(arr, index)
    move(arr, index, current_player(arr))
    display_board(arr)
  else
    turn(arr)
  end
end

def turn_count(arr)
  counter = 0
  arr.each do |char|
    if (char == 'X')
      counter += 1
    elsif (char == 'O')
      counter += 1
    end
  end
  counter
end

def current_player(arr)
  turn_count(arr).odd? ? "O" : "X"
end

def won?(arr)
  WIN_COMBINATIONS.find do |win_combo|
   pos_1 = arr[win_combo[0]]
   pos_2 = arr[win_combo[1]]
   pos_3 = arr[win_combo[2]]
   if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
     win_combo
   elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
     win_combo
  end
 end
end

def full?(arr)
  arr.all?{|element| element == "X"||element == "O"}
end

def draw?(arr)
  !won?(arr) && full?(arr)
end

def over?(arr)
  won?(arr) or draw?(arr)
end

def winner(arr)
 won?(arr) ? arr[won?(arr)[0]] : nil
end

def play(arr)
  until over?(arr) do
    turn(arr)
  end

  if won?(arr)
    puts "Congratulations #{winner(arr)}!"
  elsif draw?(arr)
    puts "Cats Game!"
  end
end
