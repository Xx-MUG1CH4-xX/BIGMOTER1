class Base
  def initialize
    @mouse = Mouse.new
    @finish = false
  end

  def update
    @mouse.update
    Window.close if Input.key_push?(K_ESCAPE)
  end

  def finish?
    return  @finish
  end

  def reset
    @finish = false
  end
end