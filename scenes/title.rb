class Title < Base
  def initialize
    super
  end

 
  def update
    super
    require 'dxruby'
    image = Image.load('C:/ruby_lecture/code/BIGMOTER1/image/a.png')  # data.pngを読み込む
        Window.draw(0, 0, image)  # data.pngを描画する
    Window.draw_font(300, 200, "LEVEL of G4NBLE", Font.new(50))
    require 'dxruby'
    image = Image.load('C:/ruby_lecture/code/BIGMOTER1/image/botann.png')  # data.pngを読み込む
        Window.draw(350, 350, image)  # data.pngを描画する

    if Input.mouse_push?(M_LBUTTON)
      @finish = true
      require 'dxruby'

      
     
    end
    
  end
end