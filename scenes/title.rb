class Title < Base
  def initialize
    super
  end

  def update
    super
    image = Image.load('image/a.png')  # data.pngを読み込む
    Window.draw(0, 0, image)  # data.pngを描画する
    Window.draw_font(300, 200, "LEVEL of G4NBLE", Font.new(50))

    if Input.mouse_push?(M_LBUTTON)
      @finish = true
    end
  end
end