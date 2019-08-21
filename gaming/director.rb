module Gaming
  class Director
    def initialize(chars)
      @char = Character.new(0, Window.height-40,"images/char.png")
      @chars = chars
      @bg_img = Image.load("images/background.png")
    end

    def play
      Window.draw(0, 0, @bg_img)
      @char.move
      @char.draw
      @chars.moves
      @chars.draws
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
    timeout(20){
      Window.loop do
        break if Input.keyPush?(K_ESCAPE)

        if x1 == $x && director1.y == Window.width - @char.width
          x1 = rand(5) * 140 + 80
          director1 = Director.new(Sprite_shimane.new(x1, 0))
        elsif director1.y == 600 
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
end