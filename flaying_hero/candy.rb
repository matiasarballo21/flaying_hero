require 'Gosu'
require_relative 'flaying_item'
class Candy < FlayingItem
  def self.image_path
    'assets/images/Candy.png'
  end
  def move!
    @x -= 10
  end
end
