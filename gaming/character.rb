class Character
  def initialize(x,y,image_file,director)
    @x,@y = x,y
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
    @director = director
  end

  def move
    @x += 30 if Input.keyPush?(K_RIGHT)
    @x -= 30 if Input.keyPush?(K_LEFT)
  end

  def draw
    Window.draw(@x,@y,@image)
  end

  def hit(obj)
    if  obj.is_a?(Sprite_shimane)
      director.clear += 1
       # strは"松江"　など
    elsif obj.is_a?(Sprite_tottori)
      director.miss += 1
    end
  end


  def tokuten
    goukei = clear - miss
  end
end
