class Base
  def initialize
    @mouse = mouse.new
    @finish = true
    @next_scene = nil
  end

  def update
    @mouse.update
  end

  def finish?
    return @finish
  end
end