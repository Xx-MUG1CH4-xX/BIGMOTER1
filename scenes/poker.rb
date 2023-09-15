class Poker < Base
  def initialize
    super
    @player = Player.new
    @card = Card.new
    @image = Image.load("images/stage_back.png")
  end

  def update
    super
    Window.draw(0,0,@image)
    @card.set_card


  end
end