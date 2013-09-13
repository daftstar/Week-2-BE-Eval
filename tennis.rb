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
      return 'love' if @points == 0
    end

 



  end  # <- ending class Player



end # <- end of file