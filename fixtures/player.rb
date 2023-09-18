class Player < Dealer
  attr_accessor :my_cards,:point
  def initialize
    super
    @point = 100
    @font = Font.new(32)
  end

  def update
    Window.draw_font(0,0,"POINT:#{@point}",Font.new(32))
  end

  def score
    return @point
  end
end