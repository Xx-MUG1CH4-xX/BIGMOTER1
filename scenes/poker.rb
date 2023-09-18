class Poker < Base
  def initialize
    super
    @player = Player.new
    @image = Image.load("image/a.png")
    @cards = []

    @change_button = Sprite.new(450,600,Image.load("image/botann.png"))

    @player.set_card
    set_card
  end

  def update
    super
    Window.draw(0,0,@image)

    @change_button.draw

    @cards.each do |card|
      card.update
    end

    @player.check_card

    if Input.mouse_push?(M_LBUTTON)
      if @mouse === @change_button
        @player.change_card
        set_card
      end
    end
  end

  def set_card
    x = 0
    y = 130
    @player.my_cards.each_with_index do |num,i|
      x += (356 + 10) * i
      @cards << Card.new(x,y,num)
    end
  end

  def next_scene
    Highlow.new
  end
end