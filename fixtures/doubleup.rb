require_relative "dealer2.rb"
require_relative "card.rb"
require_relative "../scenes/base.rb"
class DoubleUp < Base
    def initialize
        @dealer2 = Dealer2.new
        # 初期の賭け金とベット額
        @money = 1000
        @bet_amount = 100
        @key1=0
        @frag=0
    end

    def update
        font = Font.new(48)
        if Input.key_push?(K_1)
                @key1=1
        end
        if @frag==0
            
            # イベントハンドリング
            #   フラグ成立
            Window.draw(0,0,Image.load("image/a.png"))
            

            if Input.key_push?(K_2)
                key2=1
            end
            
            # 賭け金とベット額を表示
            Window.draw_font(10, 10, "Money: #{@money} yen", font)
            Window.draw_font(10, 50, "Bet Amount: #{@bet_amount} yen", font)
            if @key1==1
                @key1=0
                @frag=1
            end

            # ダブルアップの選択肢を表示
            Window.draw_font(200, 200, "1. Double Up", font)
            Window.draw_font(200, 250, "2. Quit", font)
            

        elsif @frag==1
            
            x=rand(rand(69))          
            if x%1000==0
                Window.draw_font(400, 400, "当たり！", font)
                @money=@money+2*@bet_amount
                puts 1
            else
                Window.draw_font(400, 400, "外れ", font)
                @money=@money-@bet_amount
                puts 2
            end
            
            @frag=0
        end
        if key2==1
            puts 3
            # Quitを選択した場合、ゲームを終了
            key2=0
            Window.close
        end
        if @money<0
            @finish=true
            @next_scene=Ending.new
        end
    end

    def next_scene
        @next_scene
    end
end