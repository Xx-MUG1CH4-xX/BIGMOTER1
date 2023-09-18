class Base
  def initialize
    @mouse = Mouse.new
    @finish = false
    @next_scene = nil
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