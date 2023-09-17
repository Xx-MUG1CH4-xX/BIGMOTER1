class Poker < Base
  def initialize
    super
    @player = Player.new
    @image = Image.load("image/stage_back.png")
    @cards = []
  end

  def update
    super
    Window.draw(0,0,@image)
    @player.set_card



    @player.my_cards.each do |num|
      @cards << Card.new(x,y,num)
    end
  end
end