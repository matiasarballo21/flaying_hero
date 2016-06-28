class Score
  def initialize
    @score = 0
  end
  def draw(window)
    @score = Gosu::Image.from_text(window, 'score:'+@score, font_name, line_height)
  end
end
