class Human
  attr_reader :name, :health, :strength, :intellect, :location

  def initialize(stats)
    @name = stats[:name]
    @health = stats[:health]
    @strength = stats[:strength]
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
