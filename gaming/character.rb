class Character < Sprite
  def initialize(x,y,image_file,director)
    image = Image.load(image_file)
    image.set_color_key([0, 0, 0])
    @director = director
    super(x,y,image)
  end

  def move
    self.x += 140 if Input.keyPush?(K_RIGHT)
    self.x -= 140 if Input.keyPush?(K_LEFT)
  end

  def hit(obj)
    if  obj.is_a?(Sprite_shimane)
      @director.clear += 1
       # strは"松江"　など
    elsif obj.is_a?(Sprite_tottori)
      @director.miss += 1
    end
  end

end
