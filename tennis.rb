module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      # sets the opponent of each player. 
      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    # winner - The Integer (1 or 2) representing the winning player.
    # Returns the score of the winning player. 

    def wins_ball(winner)
      # this is where we increment the winner of each ball by 1 point
      if winner == 1
        @player1.record_won_ball!
        #Player.record_won_ball!(@player1)
      elsif winner == 2
        @player2.record_won_ball!
      end


    end

  end # <- ending class Game



#------------------PLAYER FUNCTIONALITY-------------------#

  class Player 
    attr_accessor :points, :opponent, :game_points, :set_points

    def initialize
      @points = 0
      @game_points = 0
      @set_points = 0
    end


# --------  RESETS POINTS & GAME POINTS -----------------
    def reset_points
      @points = 0
      @opponent.points = 0
    end


    def reset_game_points
      @game_points = 0 
      @opponent.game_points = 0

      reset_points

    end



# -------  POINTS TO TENNIS LINGO READOUT -----------------
    # Returns the String score for the player.
    def score
      return 'love'       if @points == 0
      return 'fifteen'    if @points == 1
      return 'thirty'     if @points == 2
      return 'forty'      if @points == 3 && @opponent.points != 3
      return 'deuce!'     if @points >= 3 && @points == @opponent.points 
      return 'advantage'  if @points  > 3 && @points == @opponent.points + 1
      return 'winner'     if @points  > 3 && @points == @opponent.points + 2
    end




# --------  RECORDS WINNING A POINT -----------------

    def record_won_ball!
      # Check to see if a win-point results in a win-game outcome. 
      if @points > 3 && @points >= @opponent.points + 2
        @game_points += 1
        
        record_won_game!
        reset_points

      else
        @points +=1 
      end 
    end


# --------  RECORDS WINNING A GAME  -----------------

    def record_won_game!
      if @game_points >= 5 && @game_points >= @opponent.game_points + 2

        record_won_set!
      end
    end



# --------  RECORDS WINNING A SET  -----------------

    def record_won_set!
      reset_points
      reset_game_points     
      
      @set_points +=1
      end
    



  
  end  # <- ending class Player
end # <- end of file