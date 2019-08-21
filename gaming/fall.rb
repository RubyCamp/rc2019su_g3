class Sprite_shimane
    attr_accessor :y
    def initialize(x, y)
        @x, @y = x, y
        @str = ["松江", "浜田", "出雲", "益田", "大田", "安来", "江津", "雲南"].sample
        @font = Font.new(40)
        @yy = rand(5) + 2
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
end

class Sprite_tottori
    attr_accessor :y
    def initialize(x, y)
        @x, @y = x, y
        @str = ["倉吉", "鳥取", "米子", "会見", "岩美", "国府", "境港", "大栄"].sample
        @font = Font.new(40)
        @yy = rand(5) + 2
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
end