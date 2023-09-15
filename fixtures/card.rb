class Card < Sprite
  def initialize(x,y,num)
    super
    @route = TrancePhotoToPath.new

    self.x = x
    self.y = y
    self.image = Image.load(@route.Trance(num))
  end

  def update
    self.draw
  end
end