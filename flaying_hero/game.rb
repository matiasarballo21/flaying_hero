require 'gosu'
class game < gosu:windows
  def initialize
    super(900, 550, fullscreen: false)
    self.caption = 'Flaying Hero!'
  end

  def drow
  end

  def button_down(id)
    if id == gosu::KbEscape
      close
    end
  end
  
end
