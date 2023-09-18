class Dealer
    def initialize
        @my_cards = [0,0,0,0,0]
        @change_cards = [1,1,1,1,1]
    end

    def set_card
        #トランプ五枚分シャッフル
        (0..4).each do |i|
            shuffle_card(i)
        end
        @my_cards.sort!
        p @my_cards
    end

    def change_card
        #変更があった場所を再度抽選
        @change_cards.each_with_index do |num,i|
            p i
            shuffle_card(i) if num == 1
        end
        @my_cards.sort!
        p @my_cards
    end

    def shuffle_card(i)
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

    def check_card
        suit = []
        num = []
        @my_cards.each_with_index do |card,i|
            tmp_suit = (card - 1) / 13
            suit << "S" if tmp_suit == 0
            suit << "H" if tmp_suit == 1
            suit << "D" if tmp_suit == 2
            suit << "C" if tmp_suit == 3
            tmp_num = card % 13
            num << tmp_num
        end
    end
end