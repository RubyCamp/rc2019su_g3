require 'timeout'
require_relative 'fall'
require_relative 'character'

module Gaming
  class Director
    attr_accessor :y, :clear, :miss
    def initialize
      @char = Character.new(0, Window.height-40,"images/IMG_7974.png",self)
      # @chars = chars
      @bg_img = Image.load("images/background.png")
      @clear = 0
      @miss = 0
      @gokei = 0
      @font = Font.new(50, 'MS 明朝', weight: true)

      x1 = rand(5) * 140 + 80
      x2 = rand(5) * 140 + 80

      if x1 == x2
        while x1 == x2
          x2 = rand(5) * 140 + 80
        end
      end

      @director1 = Sprite_shimane.new(x1, 0,nil,self)
      @director2 = Sprite_tottori.new(x2, 0,nil,self)
    end

    def play
      @start_time ||= Time.now  # 制限時間の初期化
      @now_time = Time.now # 現在の時間
      @limit_time = 5  #秒
      @diff_time = @now_time - @start_time #経過時間分
      @countdown = (@limit_time - @diff_time).to_i
      min = @countdown / 60
      sec = @countdown % 60
      Window.drawFont(870, 700, "#{min}:#{sec}", @font, z:2)
      if @countdown <= 0
        @start_time = nil
        Scene.move_to(:ending)
      end
      Window.draw_scale(0, 0, @bg_img, 1.28, 1.28, 0, 0)
      if TRUE
        Window.draw_box_fill(800, 0, 1024, 768, [130, 204, 204, 204], 1)
      end

      if @director1.y == 600
        x1 = rand(5) * 140 + 80
        @director1 = Sprite_shimane.new(x1, 0, nil, self)
      end

      if @director2.y == 600
        x2 = rand(5) * 140 + 80

        if x1 == x2
          while x1 == x2
            x2 = rand(5) * 140 + 80
          end
        end

        @director2 = Sprite_tottori.new(x2, 0,nil, self)
      end

      @director1.play
      @director2.play
      #@char.check(@chars,@char)
    end

    def tocuten
      @goukei = @clear - @miss
    end

    # begin
    #   timeout(10){
    #     Window.loop do

    #     end
    #   }
    # end
  end
end
