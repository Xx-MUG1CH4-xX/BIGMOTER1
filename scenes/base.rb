class Base
  attr_accessor :finish
  def initialize
    @mouse = Mouse.new
    @finish = false
  end

  def update
    @mouse.update
  end

  def finish?
    return  @finish
  end

  def reset
    @finish = false
  end
end