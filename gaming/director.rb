require 'timeout'
require_relative 'fall'
require_relative 'character'

module Gaming
  class Director
    attr_accessor :y, :clear, :miss
    def initialize
      @char = Character.new(80, Window.height-120,"images/IMG_7974.png",self)
      # @chars = chars
      @bg_img = Image.load("images/gaming_bg/6479.png")
      Scene.set_val(:clear,0)
      Scene.set_val(:miss,0)
      @font = Font.new(50, 'MS 明朝', weight: true)
      @strong_font = Font.new(70, 'MS 明朝', weight: true)

      @sound = Sound.new("sound/td2hj-yya3p.wav")
      @timer = 0

      x1 = rand(5) * 140 + 80
      x2 = rand(5) * 140 + 80

      if x1 == x2
        while x1 == x2
          x2 = rand(5) * 140 + 80
        end
      end

      @director1 = Sprite_shimane.new(x1, -400,nil,self)
      @director2 = Sprite_tottori.new(x2, -400,nil,self)
    end

    def play
      Window.draw_box_fill(0, 0, Window.width, Window.height, C_WHITE, 0)
      
      @start_time ||= Time.now  # 制限時間の初期化
      @now_time = Time.now # 現在の時間
      @limit_time = 30  #秒
      @diff_time = @now_time - @start_time #経過時間分
      @countdown = (@limit_time - @diff_time).to_i
      min = @countdown / 60
      sec = @countdown % 60
      Window.drawFont(830, 100, "残り時間", @font, z:2, color:[0,0,0])
      Window.drawFont(850, 150, "#{min}:#{sec}", @strong_font, z:2, color:[0,0,0])
      Window.drawFont(870, 400, "得点", @font, z:2, color:[0,0,0])
      Window.drawFont(870, 450, "#{self.tokuten}点", @strong_font, z:2, color:[0,0,0])
      
      @sound.loop_count = (-1)
      if @timer == 0
        #BGMを流し始めるコード
        @sound.play
        @timer += 1
      end
          
      if @countdown <= 0
        #BGMを止めるコード
        @sound.stop
        @timer = 0
        @start_time = nil
        Scene.move_to(:ending)
      end
      Window.draw_scale(0, 0, @bg_img, 1.28, 1.28, 0, 0)
      Window.draw_box_fill(800, 0, 1024, 768, [130, 204, 204, 204], 1)

      @director1.play
      @director2.play
      @char.move
      @char.draw
      @char.check([@director1, @director2]).each do |director|
        if  director.is_a?(Sprite_shimane)
          Scene.set_val(:clear, Scene.get_val(:clear)+1)
           # strは"松江"　など
        elsif director.is_a?(Sprite_tottori)
          Scene.set_val(:miss, Scene.get_val(:miss)+ 1)
        end

        director.vanish
        director.regen = true
      end

      if @director1.regen
        x1 = rand(5) * 140 + 80
        @director1 = Sprite_shimane.new(x1, - @director1.height, nil, self)
      end

      if @director2.regen
        x2 = rand(5) * 140 + 80

        if x1 == x2
          while x1 == x2
            x2 = rand(5) * 140 + 80
          end
        end
        @director2 = Sprite_tottori.new(x2, - @director2.height,nil, self)
      end

      @director1.play
      @director2.play
      @char.move
      @char.draw
      Sprite.check([@director1, @director2],@char)
    end

    def tokuten
      Scene.get_val(:clear) - Scene.get_val(:miss)
    end
  end
end