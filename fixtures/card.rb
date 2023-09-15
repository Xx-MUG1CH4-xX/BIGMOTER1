class Card
    def initialize
        @mycards=[]
        @mycards=[0,0,0,0,0]
    end

    def shuffle
        for a in 1...5                          #トランプ五枚分シャッフル
            x=1                                 #　フラグ　初期値:真
            while x==1 do                       #　　フラグが真のとき、ひたすらシャッフル
                @mycards[a]=rand(1...52)         #　　１～52でシャッフル
                for b in 1...5                  #　　判定
                    if @mycards[b]==@mycards[a]   #　　　五枚それぞれ比較
                        break                   #　　　　一つでも同じ値があればもう一度
                    else
                        x=0                     #　　　　判定クリア：フラグ取り下げ
                    end
                end
            end
        end
    end
end