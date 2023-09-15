class Title < Base
  def initialize
    super
  end

  def update
    super
    Window.draw_font(100, 100, "title", Font.new(32))
    if Input.mouse_push?(M_LBUTTON)
      @finish = true
    end
  end
end