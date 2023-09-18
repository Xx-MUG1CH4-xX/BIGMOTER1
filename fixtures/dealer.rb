class Dealer
  attr_accessor :change_cards
    def initialize
        @my_cards = [0,0,0,0,0]
        @change_cards = [false,false,false,false,false]
    end

    def set_card
        #トランプ五枚分シャッフル
        (0..4).each do |i|
            shuffle_card(i)
        end
        @my_cards.sort!
    end

    def change_card
        #変更があった場所を再度抽選
        @change_cards.each_with_index do |bool,i|
            shuffle_card(i) if !bool
        end
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

  　#役判定
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

        flush = 1 if suit.count(suit[0]) == suit.length
        straight = 1 if num.sort[1] == num.sort[0] +1 && num.sort[2] == num.sort[0] + 2 && num.sort[3] == num.sort[0] +3 && num.sort[4] == num.sort[0] + 4 || num.sort == [1,10,11,12,13]
        #カードの数を数えてから役を判定
        count_box = []
        for i in 0..num.uniq.length-1
            count_box[i] = num.count(num.uniq[i])
        end

        if count_box.sort.reverse == [4,1]
            puts "４カード"
        elsif  count_box.sort.reverse == [3,2]
            puts "フルハウス"
        elsif  count_box.sort.reverse == [3,1,1]
            puts "３カード"
        elsif  count_box.sort.reverse == [2,2,1]
            puts "２ペア"
        elsif  count_box.sort.reverse == [2,1,1,1]
            puts "１ペア"
        elsif count_box.sort.reverse == [1,1,1,1,1]
            if num.sort == [1,10,11,12,13] && flush == 1
                puts "ロイヤルストレートフラッシュ"
            elsif straight == 1 && flush == 1 &&  num.sort != [1,10,11,12,13]
                puts "ストレートフラッシュ"
            elsif flush == 1
                puts "フラッシュ"
            elsif straight == 1
                puts "ストレート"
            else
                puts "ノーペア"
            end
        end
    end
end