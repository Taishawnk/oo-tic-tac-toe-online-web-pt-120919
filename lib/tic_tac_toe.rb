require"pry"
class TicTacToe

  def initialize(board = nil)
   @board = board || Array.new(9," ")
   #@board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
   end 
   def move(index,value)
   @board[index] = value 
   end
   def position_taken?(place)
   if @board[place] == " " 
     false
    elsif @board[place] == "X" || @board[place] == "O"
    true
   end
 end
 def valid_move?(i)
   if position_taken?(i) == false  && i.between?(0, 8) == true
     true
  else
    false
  end
 end
 
def turn_count
  @count =0
    @board.each do |token| if token !=" "
    @count+=1
  end
end

return @count 
  end

def current_player
turn_count % 2 == 0 ? "X" : "O"
end
def turn
  puts "please enter form 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index) 
    move(index,current_player)
    display_board
  else turn
end
end
def won? 
  WIN_COMBINATIONS.each do |wc| 
    win_index1 = wc[0]
    win_index2 = wc[1]
    win_index3 = wc[2]
    position1 = @board[win_index1]
    position2 = @board[win_index2]
    position3 = @board[win_index3]
  if (position1 =="X" && position2 =="X" && position3 =="X") || (position1 =="O" && position2 =="O" && position3 =="O")
  return wc 
end
end
return false
end
def full?
@board.none? {|index| index == " " || index == nil} 
end
def draw?
!won? && full?
end
def over?
draw? || won?
end

def winner
  if won? 
  @board [won?[0]]
  end
end

def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end