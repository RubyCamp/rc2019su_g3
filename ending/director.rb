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
            @strong_font = Font.new(100, 'MS 明朝', weight: true)
            @score_font = Font.new(120, 'MS 明朝', weight: true)
            @clear_font = Font.new(80, 'MS 明朝', weight: true)
            @miss_font = Font.new(80, 'MS 明朝', weight: true)
        end

        def play
            #gamingのデータを取ってこれるようになったらコメントアウトしてる部分に書き換える。

            @clear_num = Scene.get_val(:clear)
            @miss_num =  Scene.get_val(:miss)
            @score_num =  @clear_num - @miss_num

            #画面上段の文字
            Scene.move_to(:opening) if Input.key_push?(K_SPACE)
            #Window.draw_scale(5, 5, @bg_image, 1.8, 1.8, 10,10)
            Window.draw_font(370, 20, "結果発表", @strong_font, color:C_WHITE)

            #画面中段の文字
            Window.draw_font(320, 120, "得点：#{@score_num}点", @score_font, color:C_YELLOW)
                #得点に応じてコメントをだす機能
                # Window.draw_font(560, 220, "#{@comment}", @font, color:C_YELLOW)
                # if @score_num > 5
                #     @comment = "よくできました！！"
                # elsif 5 >= @score_num && @score_num > 0
                #     @comment = "まあまあだね！！"
                # else
                #     @comment = "全然だめ！"
                # end

            Window.draw_font(320, 290, "クリア：", @clear_font, color:C_MAGENTA)
            Window.draw_font(550, 290, "#{@clear_num}都市", @clear_font, color:C_MAGENTA)
            Window.draw_font(366, 360, "ミス：", @miss_font, color:[255,0,255,255])
            Window.draw_font(550, 360, "#{@miss_num}都市", @miss_font, color:[255,0,255,255])

            #画面後段の文字
            Window.draw_font(125, 500, "もう一度(Space)", @font, color:C_WHITE)
            Scene.move_to(:opening) if Input.key_push?(K_SPACE)
            Window.draw_font(585, 500, "終了(Escape)", @font, color:C_WHITE)
            Window.draw_font(380, 550, "地図を見る(Tab)", @font, color:C_WHITE)
            Window.draw_scale(80, 100, @map_image, 1.5, 1.5, 10,10) if Input.key_down?(K_TAB)
        end
    end
end
