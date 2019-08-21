module Gaming
  class Director
    attr_accessor :clear, :miss
    def initialize(chars)
      @char = Character.new(0, Window.height-40,"images/IMG_7974.png",self)
      @chars = chars
      @bg_img = Image.load("images/background.png")
      @clear -0
      @miss=0
      @gokei = 0
    end

    def play
      Window.draw(0, 0, @bg_img)
      @char.move
      @char.draw
      @char.check(@chars,@char)
      @chars.move
      @chars.draw
    end

    def y
      @chars.y
    end
  end

  require 'timeout'

  require_relative 'fall'

    x1 = rand(5) * 140 + 80
    x2 = rand(5) * 140 + 80

    if x1 == x2
      while x1 == x2
        x2 = rand(5) * 140 + 80
      end
    end


    director1 = Director.new(Sprite_shimane.new(x1, 0))
    director2 = Director.new(Sprite_tottori.new(x2, 0))

  begin
    timeout(10){
      Window.loop do
        break if Input.keyPush?(K_ESCAPE)
        if director1.y == 600
          x1 = rand(5) * 140 + 80
          director1 = Director.new(Sprite_shimane.new(x1, 0))
        end

        if director2.y == 600
          x2 = rand(5) * 140 + 80

          if x1 == x2
            while x1 == x2
              x2 = rand(5) * 140 + 80
            end
          end

          director2 = Director.new(Sprite_tottori.new(x2, 0))
        end

        director1.play
        director2.play

      end
    }
  end
  def tocuten
    @goukei = @clear - @miss
  end


end
