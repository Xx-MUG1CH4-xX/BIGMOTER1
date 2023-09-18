class Ending<Base
    @timer_aori=0
    def initialize
      super
      @timer_aori=0
      @text_aori="wwww☆"
      @text_gameover="Game Over..."
      @cnt_aori=0
    end
  
    def update
      super
      @timer_aori+=1
      
      if @timer_aori>=120 && @timer_aori<180
        Window.draw_font(700, 705, "Let's go to hell !", Font.new(15))
        @text_gameover="m9(^Д^)プギャー"
      end
      if @timer_aori>=60 && @timer_aori<180
        Window.draw_font(700, 720, "Acom,Promiss,Shinsei-Bank > Real world", Font.new(15))
        
      end
      if @timer_aori>=180
        Window.draw_font(0,0, @text_aori, Font.new(15))
        @text_aori="wwww"+@text_aori
        Window.draw_font(450-(@timer_aori-180)/8, 750/2-(@timer_aori-180)/16, @text_gameover, Font.new(15+(@timer_aori-180)/16))
        if (@timer_aori-180+2)%24==0
            @text_aori="☆\n☆"+@text_aori
            @cnt_aori+=1
            
            
        end
        if @cnt_aori>=48
            Window.close
        end
      end
      
      if Input.mouse_push?(M_LBUTTON)
        @finish = true
      end
      
      if @timer_aori<=180
        Window.draw_font(450, 750/2, @text_gameover, Font.new(15))
        Window.draw_font(820, 735, "Continue > Click", Font.new(15))
      end
    end

    def next_scene
        Poker.new
    end
end