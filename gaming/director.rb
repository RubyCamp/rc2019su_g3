class Director
  def initialize
    @char = Character.new(0, Window.height-40,"images/char.png")
    @bg_img = Image.load("images/background.png")
  end

  def play
    Window.draw(0, 0, @bg_img)
    @char.move
    @char.draw
  end
end
