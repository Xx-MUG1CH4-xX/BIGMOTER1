class Player < Dealer
  def initialize
    @point = 0
  end

  def score
    return @point
  end
end