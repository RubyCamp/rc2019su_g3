require 'prime'

module Ending
    class Director
        def initialize(args = {})
            @args = args
            prepare_scene
            # @bg_image = Image.load()
        end
        
        def prepare_scene
            @font = Font.new(100, 'MS 明朝', weight: true)
            @start_font = Font.new(50, 'MS 明朝', weight: true)
            @start_font = Font.new(50, 'MS 明朝', weight: true)
        end

        def play
            # Scene.move_to(:scene1) if Input.key_push?(K_SPACE)
            # Window.draw(0, 0, @bg_image)    

            Window.draw_font(200, 100, "しまねあつめ2", @font)
            Window.draw_font(300, 400, "Enter space", @start_font)
        end
    end
end
