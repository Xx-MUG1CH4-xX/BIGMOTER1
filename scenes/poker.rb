class Poker < Base
  def initialize
    super
    @player = Player.new
    @image = Image.load("image/a.png")
    @cards = []
    @change_button = []

    @flag = true
    @check = false

    @use_point = 100

    @set_button = Sprite.new(350,550,Image.load("image/botann.png"))

    @change = Image.load("image/change_button.png")
    @no_change = Image.load("image/no_change_button.png")

    reset_card
  end

  def update
    super
    #背景表示
    Window.draw(0,0,@image)

    #point表示
    @player.update

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

    check_point

    if @check
      image = draw_set(@setname)
      Window.draw(450,350,image)
      if @flag == true
        @player.point += @power * @use_point - @use_point
        @flag = false
      end
      if Input.mouse_push?(M_LBUTTON)
        reset_card
        @check = false
        @flag = true
      end
    else
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

  def check_point
    if @player.point <= 0
      @finish = true
      @next_scene = Ending.new
    end
  end

  def set_image(bool)
    if !bool
      Image.load("image/change_button.png")
    else
      Image.load("image/no_change_button.png")
    end
  end

  def draw_set(name)
    if name == "ノーペア"
      image = Image.load("image/no.png")
      @power = 0
    elsif name == "1ペア"
      image = Image.load("image/one.PNG")
      @power = 1
    elsif name == "2ペア"
      image = Image.load("image/two.PNG")
      @power = 2
    elsif name == "3カード"
      image = Image.load("image/three.PNG")
      @power = 3
    elsif name == "4カード"
      image = Image.load("image/four.PNG")
      @power = 4
    elsif name == "フルハウス"
      image = Image.load("image/FULLHOUSE.PNG")
      @power = 7
    elsif name == "フラッシュ"
      image = Image.load("image/FLUSH.PNG")
      @power = 5
    elsif name == "ストレート"
      image = Image.load("image/straight.PNG")
      @power = 10
    elsif name == "ストレートフラッシュ"
      image = Image.load("image/straighflash.PNG")
      @power = 50
    elsif name == "ロイヤルストレートフラッシュ"
      image = Image.load("image/ROYAL.PNG")
      @power = 500
    end

    return image
  end

  def next_scene
    @next_scene
  end
end