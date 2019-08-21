class Sprite_sanin < Sprite
  attr_reader :str
  def initialize(x, y, image, director)
      @x, @y = x, y
      @font = Font.new(40)
      super
      @director = director
  end
end

class Sprite_shimane < Sprite_sanin
    attr_reader :str
    def initialize(x, y,image,director)
        #@x, @y = x, y
        @str = ["松江", "浜田", "出雲", "益田", "大田", "安来", "江津", "雲南"].sample
        #@font = Font.new(40)
        @yy = rand(5) + 2
        super
    end

    def move
        @y += @yy
        hantei
    end

    def draw
        Window.draw_font(@x, @y, @str, @font)
    end

    def play
        move
        draw
    end

    def y
        @y
    end

    def hantei
      #if self.y + self.height > Window.height
      #  director.miss += 1
      #end
    end
end

class Sprite_tottori < Sprite_sanin
    def initialize(x, y,image,director)
        #@x, @y = x, y
        @str = ["倉吉", "鳥取", "米子", "会見", "岩美", "国府", "境港", "大栄"].sample
        #@font = Font.new(40)
        @yy = rand(5) + 2
        super
    end

    def move
        @y += @yy
    end

    def draw
        Window.draw_font(@x, @y, @str, @font)
    end

    def play
        move
        draw
    end
    def y
        @y
    end
end
