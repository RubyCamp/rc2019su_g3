require 'dxruby'
require_relative 'scene'
require_relative 'opening/director'
require_relative 'ending/director'
require_relative 'gaming/character'
require_relative 'gaming/director'

Window.caption = "Ruby Camp 2019"
Window.width = 800
Window.height = 600

Scene.add(Opening::Director.new, :opening)
Scene.add(Ending::Director.new, :ending)
Scene.move_to(:opening)

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  Scene.play
end
