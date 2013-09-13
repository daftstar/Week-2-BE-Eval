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

      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
    end

  end # <- ending class Game



#------------------PLAYER FUNCTIONALITY-------------------#


  class Player 
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    # Returns the integer new score.
    def record_won_ball!
      @points += 1

    end

    # Returns the String score for the player.
    def score

      return 'love'       if @points == 0
      return 'fifteen'    if @points == 1
      return 'thirty'     if @points == 2
      return 'forty'      if @points == 3 && @opponent.points != 3
      return 'deuce!'     if @points >= 3 && @points == @opponent.points 
      return 'advantage'  if @points  > 3 && @points == @opponent.points + 1
      return 'winner'     if @points  > 3 && @points == @opponent.points + 2


      

      #gave up on case method.  Could not figure out to use case comparisons without getting into 
      #logically difficult if/else statements.  Much simpler to use returns. 
      # case @points 
      #   when 0 # program errors if return is not on a new line. 
      #     return 'love'

      #   when 1 
      #     return "fifteen"

      #   when 2 
      #     return "thirty"

      #   when 3 
      #     if @opponent.points != 3
      #       return "forty"
      #     elsif @opponent.points == 3 
      #       return "deuce!"
      #     end

      #   #--------- This is where I gave up on the case method ------------#
      #   #-------everything above this point (in case method) worked fine -#
      #   # when 4 
      #   #   if @player.points = 
      #   #   return "advantage" if @points == @opponent.points + 1

      #   # when 5  <-- need to figure out how to set a winner. 
      #   #   return @player + (" is the winner") if (opponent.points 

      #   else 
      #     return "more than 4"  #testing string if when statements somehow failed. 
      # end #<--- end of case method


      ###----------------- this was my first attempt before using cases -------##
      # if @points == 0
      #   return 'love'

      # elsif @points == 1
      #   return 'fifteen'

      # elsif @points == 2
      #   return 'thirty'

      # elsif @points == 3
      #   return 'forty'
      # end
    end # <-- end of score method
  
  end  # <- ending class Player
end # <- end of file