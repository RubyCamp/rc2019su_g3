class Character
  def initialize(x,y,image_file)
    @x,@y = x,y
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
  end

  def move
    @x += 30 if Input.keyPush?(K_RIGHT)
    @x -= 30 if Input.keyPush?(K_LEFT)
  end

  def draw
    Window.draw(@x,@y,@image)
  end
end
