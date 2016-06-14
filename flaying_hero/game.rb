require 'gosu'
require_relative 'Background'
require_relative 'hero'
class Game < Gosu::Window
  def initialize
    @background = Background.new
    super(900, 550, fullscreen: false)
    self.caption = 'Flaying Hero!'
    @hero = Hero.new
  end

  def draw
    @background.draw
    @hero.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
  def update
     if button_down?(Gosu::KbUp )
       @hero.move_up!
  elsif button_down?(Gosu::KbDown)
      @hero.move_down!(height)
    end
    @background.scroll!
  end
end
