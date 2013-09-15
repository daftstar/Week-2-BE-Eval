require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'pry'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to eq(game.player2)
      expect(game.player2.opponent).to eq(game.player1)
    end


  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(1)

      expect(game.player1.points).to eq(1)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end


 
    # ---------- REGULAR SCORE TEST CASES ------------------------#


  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    

    context 'when points is 2' do
      it 'returns thirty' do  
        player.points = 2

        expect(player.score).to eq('thirty')
      end
    end
    

    context 'when player points is 3 and opponent points is not 3' do
      it 'returns forty' do
        player.points = 3 
        player.opponent.points = 2

        # # cannot use this setup as program exits after setting player.points to 3
        # player.points = 3 && player.opponent.points != 3

        expect(player.score).to eq('forty')
      end
    end


    context 'when player points is 3 and opponent points is 3' do
      it 'returns deuce' do
        player.points = 3
        player.opponent.points = 3

        expect(player.score).to eq('deuce!')
      end
    end


    # ---------- ADVANTAGE SCORE TEST CASES ------------------#


    context 'when player points is 4 and opponent points is 3' do
      it 'returns advantage' do
        player.points = 4
        player.opponent.points = 3

        expect(player.score).to eq('advantage')
      end
    end

    # Advantage can occur at anytime after each player has gone into deuce. 
    # 
    context 'when player points is 5 and opponent points is 4' do
      it 'returns advantage' do
        player.points = 5
        player.opponent.points = 4

        expect(player.score).to eq('advantage')
      end
    end

    # ---------- WINNING SCORE TEST CASES ------------------------#
    context 'when player points is 4 and opponent points is < 3' do
      it 'returns winner' do
        player.points = 4
        player.opponent.points = 2

        expect(player.score).to eq('winner')
      end
    end

    # this happens when players have gone beyond basic tennis deuce.  
    context 'when player points > 4 and player points 2 above opponent points' do
      it 'returns winner' do
        player.points = 8
        player.opponent.points = 6

        expect(player.score).to eq('winner')
      end
    end    


# ---------- WINNING GAME TEST CASE ------------------------#


  context 'increment game counter by 1' do
    it 'increments games won by 1' do
      player.points = 7
      player.opponent.points = 5

      player.record_won_ball! #runs method to record winning game point
      expect(player.game_points).to eq(1)
      
      #expect(player.record_won_ball!).to eq(1) - this will always return 1

    end
  end


 # ------- This shoult result in 0, testing advantage ---- #
  context 'should not increment game counter by 1' do
    it 'will not increment games won by 1' do
      player.points = 6
      player.opponent.points = 5

      player.record_won_ball! #runs method to record winning game point
      expect(player.game_points).to eq(0)
      
    end
  end


  end
end