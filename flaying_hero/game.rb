require 'gosu'
require_relative 'Background'
require_relative 'hero'
require_relative 'Candy'
require_relative 'asteroid_big'
require_relative 'asteroid_small'

class Game < Gosu::Window

  def initialize
    @background = Background.new
    super(900, 550, fullscreen: false)
    self.caption = 'Flaying Hero!'
    @hero = Hero.new
    @candy = Candy.new(self)
    set_asteroid
  end
def set_asteroid
    @asteroid = AsteroidBig.new(self)
end
  def draw
    @background.draw
    @hero.draw
    @candy.draw
    @asteroid.draw
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
      @candy.move!
      if @candy.x == 0
        @candy.reset!(self)
      end

  end
end
