class Sprite_sanin < Sprite
  attr_reader :str
  attr_accessor :regen
  def initialize(x, y, image, director)
      #@font = Font.new(40)
      super(x,y,image)
      @director = director
      @regen = false
  end
end

class Sprite_shimane < Sprite_sanin
    def initialize(x, y,image_file,director)
        #@str = ["松江", "浜田", "出雲", "益田", "大田", "安来", "江津", "雲南"].sample

        chose = ["images/shimane_moji/gotsu.png", "images/shimane_moji/hamada.png", "images/shimane_moji/iwami.png", "images/shimane_moji/izumo.png", "images/shimane_moji/masuda.png", "images/shimane_moji/matsue.png", "images/shimane_moji/ohta.png", "images/shimane_moji/unnan.png", "images/shimane_moji/yasugi.png"].sample

        image = Image.load(chose)
        #@font = Font.new(40)
        @yy = rand(5) + 2
        super(x,y,image,director)
    end
    
    def image_height
      @image.height
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
        Scene.set_val(:miss, Scene.get_val(:miss) + 1)
        self.regen = true
      end
    end
end

class Sprite_tottori < Sprite_sanin
    def initialize(x, y,image_file,director)
        chose = ["images/tottori_moji/aimi.png", "images/tottori_moji/daiei.png", "images/tottori_moji/iwami.png", "images/tottori_moji/kokufu.png", "images/tottori_moji/kurayoshi.png", "images/tottori_moji/sakaiminato.png", "images/tottori_moji/tottori.png", "images/tottori_moji/yonago.png"].sample

        image = Image.load(chose)

        @yy = rand(5) + 2
        super(x,y,image,director)
    end

    def image_height
      @image.height
    end

    def move
        self.y += @yy
        hantei
    end

    def hantei
      if self.y + self.image.height > Window.height
        self.regen = true
      end
    end
    
    def play
        move
        draw
    end
end
