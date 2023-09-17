class Dealer
    def initialize
        @my_cards = [0,0,0,0,0]
        @change = [0,0,0,0,0]
    end

    def set_card
        #トランプ五枚分シャッフル
        (0..4).each do |i|
            shuffle(i)
        end
        p @my_cards
    end

    def change
        #変更があった場所を再度抽選
        @change.each_with_index do |num,i|
            shuffle(i) if num == 1
        end
    end

    def shuffle(i)
        #かぶらないように抽選
        loop do
            n = 0
            @rand_num = rand(1..52)
            @my_cards.each do |num|
                n += 1 if @rand_num != num
            end
            break if n == 5
        end
        @my_cards[i] = @rand_num
    end
end