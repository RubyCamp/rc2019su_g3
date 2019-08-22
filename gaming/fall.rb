class Sprite_sanin < Sprite
  attr_reader :str
  def initialize(x, y, image, director)
      #@font = Font.new(40)
      super(x,y,image)
      @director = director
  end
end

class Sprite_shimane < Sprite_sanin
    def initialize(x, y,image_file,director)
        #@str = ["松江", "浜田", "出雲", "益田", "大田", "安来", "江津", "雲南"].sample
        image = Image.load("images/shimane_moji/matsue.png")
        #@font = Font.new(40)
        @yy = rand(5) + 2
        super(x,y,image,director)
    end

    def move
        self.y += @yy
        hantei
    end

    def play
        move
        draw
    end

    def hantei
      if self.y + self.image.height > Window.height
        @director.miss += 1
      end
    end
end

class Sprite_tottori < Sprite_sanin
    def initialize(x, y,image_file,director)
        image = Image.load("images/tottori_moji/aimi3.png")
        @yy = rand(5) + 2
        super(x,y,image,director)
    end

    def move
        self.y += @yy
    end

    def play
        move
        draw
    end

    def hit(obj)
      p :hit
    end

end
