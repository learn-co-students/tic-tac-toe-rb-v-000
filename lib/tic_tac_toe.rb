#!/usr/bin/env ruby

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
] # Define your WIN_COMBINATIONS constant

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts row = [" #{board[0]} | #{board[1]} | #{board[2]} "]
  puts separator = "-----------"
  puts row = [" #{board[3]} | #{board[4]} | #{board[5]} "]
  puts separator
  puts row = [" #{board[6]} | #{board[7]} | #{board[8]} "]
end

def input_to_index(user_input)
  user_input.to_i - 1
end


def player_move(board, index, value)
  board[index] = value
end


def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O" #(board[index] == ("X" || "O"))
    return true
  end
    return false
  end


  def valid_move?(board, index)
    if index.between?(0,8)
      if position_taken?(board, index)
        return false
      end
        return true
      end
        return false
      end


def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if !valid_move?(board, index) #valid_move?(board, index)
      turn(board)
    else
      player_move(board, index, current_player(board))
  end
end


def turn_count(board)
  counter = 0
  board.each do |board|
    if board == "X" || board == "O"
      counter += 1
    end
end
    return counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
    return current_player
end


def won?(board)
WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_combination
end

end
  false
end


def full?(board)
  board.all? do |board|
    board == "X" || board == "O"
  end
end


def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
    return false
end


def winner(board)
  if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end



def play(board)
  until over?(board)
  turn(board)
end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
