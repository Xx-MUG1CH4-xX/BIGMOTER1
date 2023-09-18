class Mouse < Sprite
  def initialize
    @image = Image.new(1,1,C_WHITE)
  end

  def update
    x = Input.mouse_pos_x
    y = Input.mouse_pos_y

    Window.draw(x,y,@image)
  end
end