require 'dxruby'

Dir['fixtures/*.rb',
     'scenes/*.rb',
   ].each do |file|
  require_relative file
end

$path = __dir__

scene = []

Window.loop do
  scene.update
end
