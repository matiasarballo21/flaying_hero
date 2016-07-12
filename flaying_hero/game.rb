require 'gosu'
require_relative 'background'
require_relative 'hero'
require_relative 'candy'
require_relative 'asteroid_big'
require_relative 'asteroid_small'
require_relative 'score'

class Game < Gosu::Window

  def initialize
    @background = Background.new
    super(900, 550, fullscreen: false)
    self.caption = 'Flaying Hero!'
    @hero = Hero.new
    @candy = Candy.new(self)
    set_asteroid
    @score = Score.new
  end

  def set_asteroid
    @asteroid = @asteroid && @asteroid.instance_of?(AsteroidBig) ?
    AsteroidSmall.new(self) : AsteroidBig.new(self)
    '@asteroid = AsteroidBig.new(self)'
  end

  def draw
    @background.draw
    @hero.draw
    @candy.draw
    @asteroid.draw
    @score.draw(self)
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
    @asteroid.move!
    if @candy.x == 0
      @candy.reset!(self)
    end

    if @asteroid.x < 0
      set_asteroid
    end

    if @hero.bumped_into?(@candy)
      @score.update_score!(@candy.points)
      @candy.reset!(self)
    end
    if @hero.bumped_into?(@asteroid)
      @score.update_score!(@asteroid.points)
      set_asteroid
    end
  end
end
