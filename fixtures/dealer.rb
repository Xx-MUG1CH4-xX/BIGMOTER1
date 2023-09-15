class Dealer < Sprite
    def initialize
        @my_cards=[]
        @my_cards=[0,0,0,0,0]
        @change = [0,0,0,0,0]
    end

    def set_card
        for a in 1...5                          #トランプ五枚分シャッフル
            x=1                                 #　フラグ　初期値:真
            while x==1 do                       #　　フラグが真のとき、ひたすらシャッフル
                @my_cards[a]=rand(1...52)         #　　１～52でシャッフル
                for b in 1...5                  #　　判定
                    if @my_cards[b]==@my_cards[a]   #　　　五枚それぞれ比較
                        break                   #　　　　一つでも同じ値があればもう一度
                    else
                        x=0                     #　　　　判定クリア：フラグ取り下げ
                    end
                end
            end
        end
    end

    def change
        @change.each_with_index do |num,i|
            shuffle(i) if num == 1
        end
    end

    def shuffle(i)
        rand_num = rand(1..52)
        @mycards.each do |num|
            rand_num = rand(1..52) if rand_num == num
        end
        @mycards[i] = rand_num
    end

end