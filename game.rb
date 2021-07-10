class Game
    @@squares = [1,2,3,4,5,6,7,8,9]
  

    def initialize()
        @square
        @squares=@@squares
        @grid = "#   #{@squares[0]} | #{@squares[1]} | #{@squares[2]}
#   --+---+---
#   #{@squares[3]} | #{@squares[4]} | #{@squares[5]}
#   --+---+---
#   #{@squares[6]} | #{@squares[7]} | #{@squares[8]}"
        puts @grid
        puts "Hi, Player 1. What's your name?"
        @player_1_name= gets.chomp
        puts "Nice to meet you, #{@player_1_name}. You are the Xs. And your name, Player 2?"
        @player_2_name= gets.chomp
        puts "Nice to meet you as well, #{@player_2_name}. You are the Os."
        @current_player = @player_1_name
        @mark = "X"
        @winning_lines = [[@squares[0],@squares[1],@squares[2]],        [@squares[3],@squares[4],@squares[5]],       [@squares[6],@squares[7],@squares[8]], 
[@squares[0],@squares[3],@squares[6]],   [@squares[1],@squares[4],@squares[7]],       [@squares[2],@squares[5],@squares[8]], [@squares[0],@squares[4],@squares[8]],
[@squares[2],@squares[4],@squares[6]]]

       
        self.round
    end

    def round
        
        puts "Which square do you want to mark , #{@current_player}?"
        square_choice_checker()
        display_grid(@square_choice, @mark)
        check_for_win
        player_switch
    end

    def square_choice_checker
        
        @square_choice= gets.chomp
        
        unless (@squares.include?(@square_choice.to_i))
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

    def player_switch
        

        if @current_player == @player_1_name
            @current_player=@player_2_name
            @mark = "O"

        elsif @current_player = @player_2_name
            @current_player =@player_1_name
            @mark="X"
        end
        self.round
    end

    def check_for_win

        #check win
        [[@squares[0],@squares[1],@squares[2]],        [@squares[3],@squares[4],@squares[5]],       [@squares[6],@squares[7],@squares[8]], 
[@squares[0],@squares[3],@squares[6]],   [@squares[1],@squares[4],@squares[7]],       [@squares[2],@squares[5],@squares[8]], [@squares[0],@squares[4],@squares[8]],
[@squares[2],@squares[4],@squares[6]]].each do |winning_set| 
            if winning_set.all?{|square|square=="X"}
                win()
                #add end game
            elsif winning_set.all?{|square|square=="O"}
                win()
            end 
                                            end
        #check draw
            if @squares.all?{|square| square=="X"||square=="O"}
                puts "It's a draw!"
                exit
                
            end
    end

    def win
        puts "#{@current_player} won! Good game y'all!"
        exit
    end
end


game = Game.new









