class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
    

  def self.winner(player1, player2)
    
    if player1[1] != 'S' and player1[1] != 'R' and player1[1] != 'P'
      raise NoSuchStrategyError.new("Strategy must be one of R,P,S")
    end
    if player2[1] != 'S' and player2[1] != 'R' and player2[1] != 'P'
      raise NoSuchStrategyError.new("Strategy must be one of R,P,S")
    end

    
    if player1[1] == 'S' and player2[1] == 'S'
      return player1
    end
    if player1[1] == 'P' and player2[1] == 'P'
      return player1
    end
    if player1[1] == 'R' and player2[1] == 'R'
      return player1
    end
    
    if player1[1] == 'S'
      if player2[1] == 'R'
        return player2
      else
        return player1
      end
    end
    
    if player1[1] == 'R'
      if player2[1] == 'P'
        return player2
      else
        return player1
      end
    end
    
    if player1[1] == 'P'
      if player2[1] == 'S'
        return player2
      else
        return player1
      end
    end

  end

  def self.tournament_winner(tournament)
    player1, player2 = tournament
    

    return self.winner(player1, player2)

  end

end
