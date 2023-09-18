require 'dxruby'

Dir['fixtures/dealer.rb',
    'fixtures/*.rb',
    'scenes/base.rb',
    'scenes/*.rb',
   ].each do |file|
  require_relative file
end

scene = DoubleUp.new

Window.width = 1000
Window.height = 750

Window.loop do
  scene.update
  if scene.finish?
    scene.reset
    scene = scene.next_scene
  end
end