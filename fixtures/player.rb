class Player < Dealer
  attr_accessor :my_cards
  def initialize
    @point = 0
  end

  def score
    return @point
  end
end