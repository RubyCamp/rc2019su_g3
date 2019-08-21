require 'prime'

module Opening
    class Director
        def initialize(args = {})
            @args = args
            prepare_scene
            @bg_image = Image.load('images/simane_bg.jpg')
            #　https://www.sozai-library.com/　から持ってきた。
            @ch_image = Image.load('images/IMG_7974.png')
        end
        
        def prepare_scene
            @font = Font.new(150, 'MS 明朝', weight: true)
            @start_font = Font.new(80, 'MS 明朝', weight: true)
        end

        def play
            Scene.move_to(:gaming) if Input.key_push?(K_SPACE)
            # Window.draw(0, 0, @bg_image)    

            Window.draw_font(90, 5, "しまねあつめ", @font, color:C_GREEN)
            Window.draw_ex(70, 250, @ch_image, scale_x:0.35, scale_y:0.35, center_x:10,center_y:10, angle:-15)      
            Window.draw_scale(200, 150, @bg_image, 1, 1, 10,10) 
            Window.draw_font(180, 500, "スタート(Enter)", @start_font, color:C_YELLOW)
        end
    end
end

