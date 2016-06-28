require 'Gosu'
require_relative 'flaying_item'
class Asteroid < FlayingItem
  attr_accessor :x

  def initialize(window)
      super
      @y =Random.rand(window.height - @height)
      @x =window.width - 100

      @scale_x = 1
      @scale_y = 1
  end
  def self.image_path
      'assets/images/asteroid.png'
  end
  def draw
    @image.draw(@x, @y, 1, @scale_x, @scale_y)
  end
end
