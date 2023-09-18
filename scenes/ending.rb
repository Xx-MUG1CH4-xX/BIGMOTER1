class Ending<Base
    @timer_aori=0
    def initialize
      super
      @timer_aori=0
      @text_aori="ww☆"
      @text_gameover="Game Over..."
      @cnt_aori=0
    end
  
    def update
      super
      @timer_aori+=1
      #image = Image.load('image/a.png')  # data.pngを読み込む
      #Window.draw(0, 0, image)  # data.pngを描画する
      
      if @timer_aori>=120 || @timer_aori<180
        Window.draw_font(700, 705, "Let's go to hell !", Font.new(15))
      end
      if @timer_aori>=60 || @timer_aori<180
        Window.draw_font(700, 720, "Acom,Promiss,Shinsei-Bank > Real world", Font.new(15))
        @text_gameover="m9(^Д^)プギャー"
      end
      if @timer_aori>=180
        Window.draw_font(0,0, @text_aori, Font.new(15))
        @text_aori="ww"+@text_aori
        if (@timer_aori-180+2)%48==0
            @text_aori="☆\n☆"+@text_aori
            @cnt_aori+=1
        end
        if @cnt_aori>=40
            Window.close
        end
      end
      
      if Input.mouse_push?(M_LBUTTON)
        @finish = true
      end
      
      Window.draw_font(450, 750/2, @text_gameover, Font.new(15))
      Window.draw_font(820, 735, "Continue > Click", Font.new(15))
    end

    def next_scene
        Poker.new
    end
end