class Card < Sprite
  def initialize(x,y,num)
    route = TrancePhotoToPath.new
    @path = route.Trance(num)
    self.x = x
    self.y = y
    self.image = Image.load(@path)
  end

  def update
    self.draw
  end
end