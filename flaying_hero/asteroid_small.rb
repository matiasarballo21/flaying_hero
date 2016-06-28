require 'gosu'
require_relative 'asteroid'
class AsteroidSmall < Asteroid
  def move!
    @x -=30
  end
end
