class Poker < Base
  def initialize
    super
    @player = Player.new
    @image = Image.load("image/a.png")
    @cards = []
    @change_button = []

    @set_button = Sprite.new(450,600,Image.load("image/botann.png"))

    @change = Image.load("image/change_button.png")
    @no_change = Image.load("image/no_change_button.png")

    @player.set_card
    set_card
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
      end
      #かえるボタン
      @change_button.each_with_index do |button,i|
        if @mouse === button
          @player.change_cards[i] = !@player.change_cards[i]
          button.image = set_image(@player.change_cards[i])
        end
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

  def set_image(bool)
    if !bool
      Image.load("image/change_button.png")
    else
      Image.load("image/no_change_button.png")
    end
  end

  def next_scene
    Highlow.new
  end
end