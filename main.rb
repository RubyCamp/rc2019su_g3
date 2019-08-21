require 'dxruby'
require_relative 'scene'
require_relative 'opening/director'
require_relative 'ending/director'
require_relative 'gaming/character'
require_relative 'gaming/director'
require_relative 'gaming/fall'

Window.caption = "しまねあつめ"
Window.width = 1024
Window.height = 768

Scene.add(Opening::Director.new, :opening)
Scene.add(Gaming::Director.new, :gaming)
Scene.add(Ending::Director.new, :ending)
Scene.move_to(:opening)

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  Scene.play
end
