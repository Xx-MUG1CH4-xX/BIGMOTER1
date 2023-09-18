class Poker < Base
  def initialize
    super
    @player = Player.new
    @image = Image.load("image/a.png")
    @cards = []
    @change_button = []

    @check = false

    @set_button = Sprite.new(350,550,Image.load("image/botann.png"))

    @change = Image.load("image/change_button.png")
    @no_change = Image.load("image/no_change_button.png")

    reset_card
  end

  def update
    super
    #背景表示
    Window.draw(0,0,@image)

    #くばるボタン表示
    @set_button.draw

    #カード表示
    @cards.each_with_index do |card,i|
      card.update
    end

    #かえるボタン表示
    @change_button.each do |button|
      button.draw
    end

    #マウスクリック確認
    if Input.mouse_push?(M_LBUTTON)
      #配るボタン
      if @mouse === @set_button
        @player.change_card
        set_card
        @setname = @player.check_card
        @check = true
      end
      #かえるボタン
      @change_button.each_with_index do |button,i|
        if @mouse === button
          @player.change_cards[i] = !@player.change_cards[i]
          button.image = set_image(@player.change_cards[i])
        end
      end
    end

    if @check
      image = draw_set(@setname)
      Window.draw(450,350,image)
      if Input.key_push?(K_SPACE)
        reset_card
        @check = false
      end
    end
  end

  def set_card
    y = 130
    @player.my_cards.each_with_index do |num,i|
      x = 55 +(160 + 20) * i
      @cards[i] = Card.new(x,y,num)
      @change_button[i] = Sprite.new(x,y + (226 + 20),Image.load("image/change_button.png"))
    end
  end

  def reset_card
    @player.reset_change
    @player.set_card
    set_card
  end

  def set_image(bool)
    if !bool
      Image.load("image/change_button.png")
    else
      Image.load("image/no_change_button.png")
    end
  end

  def draw_set(name)
    image = Image.load("image/no.png") if name == "ノーペア"
    image = Image.load("image/one.PNG") if name == "1ペア"
    image = Image.load("image/two.PNG") if name == "2ペア"
    image = Image.load("image/three.PNG") if name == "3カード"
    image = Image.load("image/four.PNG") if name == "4カード"
    image = Image.load("image/FULLHOUSE.PNG") if name == "フルハウス"
    image = Image.load("image/FLUSH.PNG") if name == "フラッシュ"
    image = Image.load("image/straight.PNG") if name == "ストレート"
    image = Image.load("image/straighflash.PNG") if name == "ストレートフラッシュ"
    image = Image.load("image/ROYAL.PNG") if name == "ロイヤルストレートフラッシュ"

    return image
  end

  def next_scene
    Highlow.new
  end
end