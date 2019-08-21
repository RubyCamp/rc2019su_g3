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

    def y
      @chars.y
    end

    def play
      Scene.move_to(:ending) if Input.key_push?(K_SPACE)
      Window.draw_scale(0, 0, @bg_img, 1.28, 1.28, 0, 0)
      if TRUE
        Window.draw_box_fill(800, 0, 1024, 768, [130, 204, 204, 204], 1)
      end

      if @director1.y == 600
        x1 = rand(5) * 140 + 80
        @director1 = Sprite_shimane.new(x1, 0)
      end

      if @director2.y == 600
        x2 = rand(5) * 140 + 80

        if x1 == x2
          while x1 == x2
            x2 = rand(5) * 140 + 80
          end
        end

        @director2 = Sprite_tottori.new(x2, 0)
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
