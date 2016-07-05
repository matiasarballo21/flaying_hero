require 'gosu'
class Score
  def initialize

    @point = 0
   end
    def draw(window)
      @score = Gosu::Image.from_text(window, "score: #{@point}", 'Arial', 45)
      @score.draw(0,0,1)
    end
    def update_score!(point)
        @point = @point + point
    end
end
