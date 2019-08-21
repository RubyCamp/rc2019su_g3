require 'prime'

module Ending
    class Director
        def initialize(args = {})
            @args = args
            prepare_scene
            @map_image = Image.load('images/32-shimane2.png')
        end
        
        def prepare_scene
            @font = Font.new(50, 'MS 明朝', weight: true)
            @score_font = Font.new(120, 'MS 明朝', weight: true)
            @clear_font = Font.new(80, 'MS 明朝', weight: true)
            @miss_font = Font.new(80, 'MS 明朝', weight: true)
        end

        def play
            # Scene.move_to(:scene1) if Input.key_push?(K_SPACE)
            # Window.draw(0, 0, @bg_image)    

            @clear_num = 5
            @miss_num = 3
            @score_num = 10
            #@clear_num = Scene.get_val(:clear_num)
            #@miss_num =  Scene.get_val(:miss_num)
            #@score_num =  Scene.get_val(:score_num)
    
            if @score_num > 5
                @comment = "よくできました！！"
            elsif 5 >= @score_num && @score_num > 0 
                @comment = "まあまあだね！！"
            else 
                @comment = "全然だめ！"
            end

            Scene.move_to(:opening) if Input.key_push?(K_SPACE)
            #Window.draw_scale(5, 5, @bg_image, 1.8, 1.8, 10,10) 
            Window.draw_font(320, 20, "結果発表", @font, color:C_WHITE)

            Window.draw_font(80, 100, "得点：#{@score_num}点", @score_font, color:C_RED)
            Window.draw_font(500, 220, "#{@comment}", @font, color:C_RED)

            Window.draw_font(260, 290, "クリア：", @clear_font, color:C_MAGENTA)
            Window.draw_font(490, 290, "#{@clear_num}都市", @clear_font, color:C_MAGENTA)
            Window.draw_font(306, 360, "ミス：", @miss_font, color:C_BLUE)
            Window.draw_font(490, 360, "#{@miss_num}都市", @miss_font, color:C_BLUE)

            Window.draw_font(65, 500, "もう一度(Space)", @font, color:C_WHITE)
            Scene.move_to(:opening) if Input.key_push?(K_SPACE)
            Window.draw_font(525, 500, "終了(Escape)", @font, color:C_WHITE)
            Window.draw_font(320, 550, "地図を見る(Tab)", @font, color:C_WHITE)
            Window.draw_scale(100, 100, @map_image, 1.5, 1.5, 10,10) if Input.key_down?(K_TAB)


        end
    end
end
