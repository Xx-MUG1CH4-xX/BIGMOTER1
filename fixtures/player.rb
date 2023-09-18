class Player < Dealer
  attr_accessor :my_cards
  def initialize
    super
    @point = 0
  end

  def score
    return @point
  end
end