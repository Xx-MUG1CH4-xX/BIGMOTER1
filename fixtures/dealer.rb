class Dealer < Sprite
    def initialize
        @my_cards=[0,0,0,0,0]
        @change = [0,0,0,0,0]
    end

    def set_card
        (1..5).each do |i|
            shuffle(i)
        end                          #トランプ五枚分シャッフル
    end

    def change
        @change.each_with_index do |num,i|
            shuffle(i) if num == 1
        end
    end

    def shuffle(i)
        rand_num = rand(1..52)
        @my_cards.each do |num|
            rand_num = rand(1..52) if rand_num == num
        end
        @my_cards[i] = rand_num
    end
end