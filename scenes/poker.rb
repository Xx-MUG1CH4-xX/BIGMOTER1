class Poker < Base
  def initialize
    super
    @player = Player.new
    @image = Image.load("images/stage_back.png")
  end

  def update
    super
    Window.draw(0,0,@image)
    Window.draw_font(0,0,"score:#{@player.score}",Font.new(24))

  end
end