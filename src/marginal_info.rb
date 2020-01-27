class MarginalInfo
  attr_reader :health, :alcohol, :happyness, :tiredness, :money

  def initialize(health, alcohol, happyness, tiredness, money)
    @health     = health
    @alcohol    = alcohol
    @happyness  = happyness
    @tiredness  = tiredness
    @money      = money
  end

  def health=(var)
    if var < 0
      @health = 0
    elsif var > 100
      @health = 100
    else
      @health = var
    end
  end

  def alcohol=(var)
    if var < 0
      @alcohol = 0
    elsif var > 100
      @alcohol = 100
    else
      @alcohol = var
    end
  end

  def happyness=(var)
    if var < -10
      @happyness = -10
    elsif var > 10
      @happyness = 10
    else
      @happyness = var
    end
  end

  def tiredness=(var)
    if var < 0
      @tiredness = 0
    elsif var > 100
      @tiredness = 100
    else
      @tiredness = var
    end
  end

  def money=(var)
    if var < 0
      @money = 0
    else
      @money = var
    end
  end
end
