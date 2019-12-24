require 'rubygems'
require 'gosu'

class MarginalValera < Gosu::Window
  def initialize width = 626, height = 378
    super width, height, false
    self.caption = caption
    # @background_music = Gosu::Song.new("media/1.ogg")
    @background_music = Gosu::Song.new("media/2.ogg")
    @background_music.play(true)

    Banner.new.show
    self.close
  end

  def update
  end

  def draw
  end

  def caption
    "Marginal Valera"
  end
end

class Banner < Gosu::Window
  def initialize width = 626, height = 378
    super width, height, false
    @background_image = Gosu::Image.new("media/1.png", :tileable => true)
    @text = Gosu::Font.new(20)
  end

  def button_down id
    close if id == Gosu::KbEscape
    #через InputManager
    GamePlay.new if id == Gosu::KbN
    GameLoad.new if id == Gosu::KbL
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
    banner = File.open("media/banner/banner.txt", "r+")
    i = 0
    banner.each do |line|
      @text.draw_text(line, 0, i, 0)
      i += 20
    end
    banner.close
    @text.draw_text("version 10", 300, 140, 0)
    @text.draw_text("New game (N)", 300, 180, 0)
    @text.draw_text("Load game (L)", 300, 200, 0)
    @text.draw_text("Exit game (Esc)", 300, 220, 0)
  end
end
