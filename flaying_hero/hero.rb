require 'gosu'
require_relative 'flaying_item'
class Hero
  attr_accessor
  def initialize
    @sprites = Gosu::Image::load_tiles('assets/images/cat.png', 847/6, 87, tileable: false)
    @x = 10
    @y = 200
    @width = @sprites.first.width
    @height = @sprites.first.height
  end

  def draw
    sprite = @sprites[Gosu::milliseconds / 75% @sprites.size]
    sprite.draw(@x, @y, 1)
  end

  def move_up!
    if @y != 0
      @y -= 10
    end
  end

  def move_down!(height)
    if @y<height - @height
      @y += 10
    end
  end

  def bumped_into?(object)
    if @y > (object.y + object.height)
      false
    elsif (@y + @height) < object.y
      false
    elsif @x > (object.x + object.width)
      false
    elsif (@x + @width) < object.x
      false
    else
      true
    end

  end

end
