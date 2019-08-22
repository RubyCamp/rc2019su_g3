require 'prime'

module Opening
    class Director
        def initialize(args = {})
            @args = args
            prepare_scene
            @bg_image = Image.load('images/simane_bg.jpg')
            @ch_image = Image.load('images/IMG_7974.png')
        end
        
        def prepare_scene
            @font = Font.new(150, 'MS 明朝', weight: true)
            @start_font = Font.new(80, 'MS 明朝', weight: true)
        end

        def play
            Scene.set_val(:clear,0)
            Scene.set_val(:miss,0)
            Scene.move_to(:gaming) if Input.key_push?(K_RETURN) 
            Window.draw_font(170, 10, "しまねあつめ", @font, color:C_GREEN)
            Window.draw_ex(150, 300, @ch_image, scale_x:0.7, scale_y:0.7, center_x:10,center_y:10, angle:-15)      
            Window.draw_scale(280, 230, @bg_image, 1, 1, 10,10) 
            Window.draw_font(260, 600, "スタート(Enter)", @start_font, color:C_YELLOW)
        end
    end
end

