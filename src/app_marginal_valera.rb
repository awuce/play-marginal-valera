require 'rubygems'
require 'gosu'

class MarginalValera < Gosu::Window
  def initialize
    super 626, 378, false
    self.caption = caption
    @background_image = Gosu::Image.new("media/1.png", :tileable => true)
    @background_music = Gosu::Song.new("media/1.ogg")
    @background_music.play(true)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
  end

  def caption
    "Marginal Valera"
  end
end
