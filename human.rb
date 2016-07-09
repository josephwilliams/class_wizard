class Human
  attr_reader :name, :intellect, :location
  attr_accessor :health

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @intellect = stats[:intellect]
    @location = 0
  end

  def run
    @location += 5
    "#{@name} wanders through the forest"
  end

  def speak(words)
    words + ", says #{@name}"
  end
end
