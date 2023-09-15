require 'dxruby'

Dir['fixtures/*.rb',
    'scenes/base.rb',
    'scenes/*.rb',
   ].each do |file|
  require_relative file
end

title = Title.new
poker = Poker.new
highlow = Highlow.new
scene = [title, poker,highlow]
i = 0
Window.width=1000
Window.height=750

Window.loop do
  i = 1 if i > 2
  scene[i].update
  if scene[i].finish?
    scene[i].reset
    i += 1
  end
end