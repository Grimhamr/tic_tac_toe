class Game
    @@squares = [1,2,3,4,5,6,7,8,9]
  

    def initialize()
        
        @squares=@@squares
        @grid = "#   #{@squares[0]} | #{@squares[1]} | #{@squares[2]}
#   --+---+---
#   #{@squares[3]} | #{@squares[4]} | #{@squares[5]}
#   --+---+---
#   #{@squares[6]} | #{@squares[7]} | #{@squares[8]}"
        puts @grid
        self.intro
        
    end

    def intro
        puts "Hi, Player 1. What's your name?"
        @player_1_name= gets.chomp
        puts "Nice to meet you, #{@player_1_name}. You are the Xs. And your name, Player 2?"
        @player_2_name= gets.chomp
        puts "Nice to meet you as well, #{@player_2_name}. You are the Os."

        self.round
    end

    def round
        puts "Which square do you want to mark , #{@player_1_name}?"
        square_choice_checker()
        p @square_choice
        
        @squares[@square_choice.to_i-1]
        display_grid(@square_choice, current_player)
        
    end

    def square_choice_checker
        
        @square_choice= gets.chomp
        
        unless (@squares.include?(@square_choice.to_i)) #this will probably later cause an issue by letting them select already occupied squares
            puts "#{@square_choice}.to_i is not a valid square"
            puts "Please choose an unmarked square by selecting 1-9"
            square_choice_checker()
        end
        

    end

    def display_grid(square_to_be_changed, current_player)
        @squares[square_to_be_changed.to_i-1]=current_player
        @grid = "#   #{@squares[0]} | #{@squares[1]} | #{@squares[2]}
#   --+---+---
#   #{@squares[3]} | #{@squares[4]} | #{@squares[5]}
#   --+---+---
#   #{@squares[6]} | #{@squares[7]} | #{@squares[8]}"
    puts @grid

    end


end
squares = [1,2,3,4,5,6,7,8,9]

game = Game.new







#change square to symbol through array

#add to iterator

#after 5 iterations(minimum to win), check if any of the lines are all the same 
#WINNING_LINES.each{|set| winner = current_player if set.all?{|square|square=="X" || square == "O"}}

WINNING_LINES = [[squares[0],squares[1],squares[2]],        [squares[3],squares[4],squares[5]],       [squares[6],squares[7],squares[8]], 
[squares[0],squares[3],squares[6]],   [squares[1],squares[4],squares[7]],       [squares[2],squares[5],squares[8]], [squares[0],squares[4],squares[8]],
[squares[2],squares[4],squares[6]]]






