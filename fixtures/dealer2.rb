require_relative "TrancePhotoToPath.rb"
class Dealer2 < TrancePhotoToPath

# プレイヤーとディーラーの初期手札
# シャッフル
def initialize
    $my_cards = [0]
    $dealer2_cards = [0]
end

def shuffle_card1(i)
    #かぶらないように抽選
    loop do
        n = 0
        $rand_num = rand(1..52)
        $my_cards.each do |num|
            n += 1 if $rand_num != num
        end
        break if n == 1
    end
    $my_cards[i] = $rand_num
end

def shuffle_card2(i)
    #かぶらないように抽選
    loop do
        n = 0
        $rand_num = rand(1..52)
        $dealer2_cards.each do |num|
            n += 1 if $rand_num != num
        end
        break if n == 1
    end
    $dealer2_cards[i] = $rand_num
end
end


=begin
# ウィンドウの設定
Window.width = 800
Window.height = 600


if @my_cards
    # @my_cards が nil でない場合にのみ join メソッドを呼び出す
    joined_cards = @my_cards.join(', ')
    # もしくは、@my_cards が nil の場合に代替の処理を行う
  else
    joined_cards = "プレイヤーの手札はありません"
  end
  if @dealer2_cards
    # @my_cards が nil でない場合にのみ join メソッドを呼び出す
    joined_cards = @dealer2_cards.join(', ')
    # もしくは、@my_cards が nil の場合に代替の処理を行う
  else
    joined_cards = "プレイヤーの手札はありません"
  end  



# ゲームループ
#Window.loop do
  # 描画
  Window.draw_font(10, 10, "プレイヤーの手札: #{@my_cards.join(', ')}", Font.default)
  Window.draw_font(10, 40, "ディーラーの手札: #{@dealer2_cards.first} と ? と ? と ?", Font.default)

  # ゲーム終了条件
  if @my_cards.size == 1 && @dealer2_cards.size == 1
  end
end

# ゲーム終了
=end