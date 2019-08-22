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
  end

end
