class Player < Dealer
  attr_accessor :my_cards
  def initialize
    super
    @point = 1000
  end

  def score
    return @point
  end
end