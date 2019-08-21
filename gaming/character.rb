class Character
  def initialize(x,y,image_file)
    @x,@y = x,y
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
  end

  def move
    @x += 30 if Input.keyPush?(K_RIGHT)
    @x -= 30 if Input.keyPush?(K_LEFT)
    $x = @x
  end

  def draw
    Window.draw(@x,@y,@image)
  end

  #def hit(obj)
  #  if obj ==
  #    clear += 1
  #  else
  #    miss += 1
  #  end
  #end

  #def hantei
  #  miss += 1 if
  #end
end
